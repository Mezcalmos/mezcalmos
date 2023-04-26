import { service_provider_customer_chat_constraint } from "../../../../../hasura/library/src/generated/graphql-zeus";
import { getHasura } from "../../../utilities/hasura";
import { DirectChatDetails } from "../../chat/createChat";
import { ChatType, AppParticipant, AppTypeToChatInfoAppName, ChatInfoAppName, ChatInfo } from "../../models/Generic/Chat";
import { AppType, MezError } from "../../models/Generic/Generic";
import { CustomerInfo, MezAdmin, UserInfo } from "../../models/Generic/User";
import { ServiceProvider, ServiceProviderToAppType } from "../../models/Services/Service";

export async function createServiceProviderCustomerChat(serviceProvider: ServiceProvider, customer: CustomerInfo): Promise<number> {
    let chain = getHasura();
    let operatorsDetails = serviceProvider.operators!.map((r:any) => {
        return {
            participant_id: r.userId,
            app_type_id: ServiceProviderToAppType[serviceProvider.serviceProviderType]
        };
    });
    let chatInfo: Partial<Record<ChatInfoAppName, ChatInfo>> = {
        [ChatInfoAppName.CustomerApp]: {
            chatTitle: serviceProvider.name,
            chatImage: serviceProvider.image,
        },
        [AppTypeToChatInfoAppName[ServiceProviderToAppType[serviceProvider.serviceProviderType]]]: {
            chatTitle: customer.name ?? "Customer",
            chatImage: customer.image,
        },
    }

    let response = await chain.mutation({
        insert_service_provider_customer_chat_one: [{
            object: {
                customer_id: customer.id,
                service_provider_id: serviceProvider.id,
                service_provider_type: serviceProvider.serviceProviderType,
                chat: {
                    data: {
                        chat_info: JSON.stringify(chatInfo),
                        chat_participants: {
                            data: [{
                                    participant_id: customer.id,
                                    app_type_id: AppType.Customer
                                },
                                ...operatorsDetails
                            ]
                        }
                    }
                }
            }, on_conflict: {
                constraint: service_provider_customer_chat_constraint.service_provider_customer_cha_customer_id_service_provider__key,
                update_columns: []
            }
        },{
            chat_id: true,
        }]
    })
    if(response.insert_service_provider_customer_chat_one == null) {
        throw new MezError("chatCreationError");
    }
    return response.insert_service_provider_customer_chat_one.chat_id
}

export async function createDirectChat(user1: UserInfo, user2: UserInfo, directChatDetails: DirectChatDetails) {
    let chain = getHasura();

    let chatInfo: Record<number, any> = {};
    chatInfo[user1.id] = {
        chatTitle: user2.name ?? AppParticipant[directChatDetails.user2AppType],
        chatImage: user2.image,
    };
    chatInfo[user2.id] = {
        chatTitle: user1.name ?? AppParticipant[directChatDetails.user1AppType],
        chatImage: user1.image,
    };

    await chain.mutation({
        insert_direct_chat_one: [{
            object: {
                user_id1: user1.id,
                user_id2: user2.id,
                chat: {
                    data: {
                        chat_info: JSON.stringify(chatInfo),
                        chat_participants: {
                            data: [{
                                app_type_id: directChatDetails.user1AppType,
                                participant_id: user1.id
                            }, {
                                app_type_id: directChatDetails.user2AppType,
                                participant_id: user2.id
                            }]
                        },
                        chat_type: ChatType.Direct
                    }
                }
            }
        }, {
            chat_id: true
        }]
    });
}
export async function createMezAdminChat(user: UserInfo, userAppType: AppType, mezAdmins: MezAdmin[]) {
    let chain = getHasura();

    let mezAdminsDetails = mezAdmins.map((m:any) => {
        return {
            participant_id: m.id,
            app_type_id: AppType.MezAdmin
        };
    });

    await chain.mutation({
        insert_mez_admin_chat_one: [{
            object: {
                user_id: user.id,
                app_type: userAppType,
                chat: {
                    data: {
                        chat_info: JSON.stringify({
                            [AppTypeToChatInfoAppName[userAppType]]: {
                                chatTitle: "Mez Admin",
                                chatImage: "https://firebasestorage.googleapis.com/v0/b/mezcalmos-31f1c.appspot.com/o/logo%402x.png?alt=media&token=4a18a710-e267-40fd-8da7-8c12423cc56d",
                            },
                            [ChatInfoAppName.MezAdminApp]: {
                                chatTitle: user.name ?? AppParticipant[userAppType],
                                chatImage: user.image,
                            },
                        }),
                        chat_participants: {
                            data: [{
                                    participant_id: user.id,
                                    app_type_id: userAppType
                                },
                                ...mezAdminsDetails
                            ]
                        },
                    }
                }
            }
        },{
            chat_id: true,
        }]
    })
}