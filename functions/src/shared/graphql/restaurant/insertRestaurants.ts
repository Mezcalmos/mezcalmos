import { getHasura } from "../../../utilities/hasura";

export async function insertRestaurants(data: any) {
    let chain = getHasura();
    const restaurants = data.map((r: any, index: number) => {
        let description = [];
        if(r.description.en) {
            description.push({
                language_id: "en",
                value: r.description.en,
            })
        }
        if(r.description.es) {
            description.push({
                language_id: "es",
                value: r.description.es
            })
        }
        let categories = undefined;
        if(r.categories) {
            categories = r.categories.map((c: any) => {
                let name = [];
                // if(!(c.name))
                    
                if(c.name.en) {
                    name.push({
                        language_id: "en",
                        value: c.name.en
                    })
                }
                if(c.name.es) {
                    name.push({
                        language_id: "es",
                        value: c.name.es
                    })
                }
                let categoryDescription = undefined;
                if(c.description) {
                    categoryDescription = [];
                    if(c.description.en) {
                        categoryDescription.push({
                            language_id: "en",
                            value: c.description.en
                        })
                    }
                    if(c.description.es) {
                        categoryDescription.push({
                            language_id: "es",
                            value: c.description.es
                        })
                    }
                }
                let items = undefined
                if(c.items) {
                    items = c.items.map((i: any) => {
                        let itemName = [];
                        if(i.name.en) {
                            itemName.push({
                                language_id: "en",
                                value: i.name.en
                            })
                        }
                        if(i.name.es) {
                            itemName.push({
                                language_id: "es",
                                value: i.name.es
                            })
                        }
                        let itemDescription = undefined;
                        if(i.description) {
                            itemDescription = [];
                            if(i.description.en) {
                                itemDescription.push({
                                    language_id: "en",
                                    value: i.description.en
                                })
                            }
                            if(i.description.es) {
                                itemDescription.push({
                                    language_id: "es",
                                    value: i.description.es
                                })
                            }
                        }
                        let options = undefined;
                        if(i.options) {
                            options = i.options.map((o: any) => {
                                let optionName = [];
                                if(o.name.en) {
                                    optionName.push({
                                        language_id: "en",
                                        value: o.name.en
                                    })
                                }
                                if(o.name.es) {
                                    optionName.push({
                                        language_id: "es",
                                        value: o.name.es
                                    })
                                }
            
                                return {
                                    restaurant_id: index + 1,
                                    item_options: {
                                        data: [{
                                            name: {
                                                data: {
                                                    service_provider_id: index + 1,
                                                    service_provider_type: "restaurant",
                                                    translations: {
                                                        data: optionName
                                                    }
                                                }
                                            },
                                            restaurant_id: index + 1,
                                            option_type: o.optionType,
                                            minimum_choice: o.minimumChoice,
                                            maximum_choice: o.maximumChoice,
                                            free_choice: o.freeChoice,
                                            cost_per_extra: o.costPerExtra,
                                            // choices: (choices) ? {
                                            //     data: choices
                                            // }: undefined
                                        }]
                                    }
                                }
                                // console.log(JSON.stringify(a))
                                // return a
                            })
                        }
                        // console.log(JSON.stringify(options[0], null, "\t"))
                        return {
                            name: {
                                data: {
                                    service_provider_id: index + 1,
                                    service_provider_type: "restaurant",
                                    translations: {
                                        data: itemName
                                    }
                                }
                            },
                            description: itemDescription ? {
                                data: {
                                    service_provider_id: index + 1,
                                    service_provider_type: "restaurant",
                                    translations: {
                                        data: itemDescription
                                    }
                                }
                            }: undefined,
                            position: i.position,
                            available: i.available,
                            cost: i.cost,
                            restaurant_id: index + 1,
                            options: (options) ? {
                                data: options
                            }: undefined
                        }
                    });
                }
                
                return {
                    name: {
                        data: {
                            service_provider_id: index + 1,
                            service_provider_type: "restaurant",
                            translations: {
                                data: name
                            }
                        }
                    },
                    description: categoryDescription ? {
                        data: {
                            service_provider_id: index + 1,
                            service_provider_type: "restaurant",
                            translations: {
                                data: categoryDescription
                            }
                        }
                    }: undefined,
                    position: c.position,
                    items: (items) ? {
                        data: items
                    }: undefined
                }
            })
        }
        
        return {
            id: index + 1,
            firebase_id: r.firebaseId,
            details: {
                name: r.name,
                image: r.image,
                location: {
                    data: {
                        gps: JSON.stringify({
                            "type": "point",
                            "coordinates": [r.location.lng, r.location.lat]
                        }),
                        address: r.location.address,
                    }
                },
                description: {
                    data: {
                        service_provider_id: index + 1,
                        service_provider_type: "restaurant",
                        translations: {
                            data: description
                        }
                    }
                },
                open_status: r.openStatus,
                // language_id: r.languageId,
                approved: r.approved,
                schedule: r.schedule,
            },
            categories: (categories) ? {
                data: categories
            }: undefined
        }
    })
    console.log(restaurants.length)
    // console.log(JSON.stringify(restaurants[1]))//.categories.data[0].items.data[0].options.data[0].item_options.data[0].choices))//.data[0].option_choices.data)

    let response: any[] = [];
    // await chain.mutation({
    //     insert_restaurant_restaurant: [{
    //         objects: restaurants.slice(0, 2)
    //     }, {
    //         returning: {
    //             id: true,
    //             categories: [{}, {
    //                 items: [{}, {
    //                     options: [{}, {
    //                         option_id: true
    //                     }]
    //                 }]
    //             }],
    //         }
    //     }]
    // });
    for(let restaurant of restaurants) {
        let tempResponse = await chain.mutation({
            insert_restaurant_restaurant_one: [{
                object: restaurant
            }, {
                    id: true,
                    categories: [{}, {
                        items: [{}, {
                            options: [{}, {
                                option_id: true
                            }]
                        }]
                    }],
            }]
        });
        response.push(tempResponse);
    }
  console.log("response: ", response);
  const restaurants1 = data.map((r: any, index: number) => {
    let description = [];
    if(r.description.en) {
        description.push({
            language_id: "en",
            value: r.description.en,
        })
    }
    if(r.description.es) {
        description.push({
            language_id: "es",
            value: r.description.es
        })
    }
    let categories = undefined;
    if(r.categories) {
        categories = r.categories.map((c: any) => {
            let name = [];
            // if(!(c.name))
                
            if(c.name.en) {
                name.push({
                    language_id: "en",
                    value: c.name.en
                })
            }
            if(c.name.es) {
                name.push({
                    language_id: "es",
                    value: c.name.es
                })
            }
            let categoryDescription = undefined;
            if(c.description) {
                categoryDescription = [];
                if(c.description.en) {
                    categoryDescription.push({
                        language_id: "en",
                        value: c.description.en
                    })
                }
                if(c.description.es) {
                    categoryDescription.push({
                        language_id: "es",
                        value: c.description.es
                    })
                }
            }
            let items = undefined
            if(c.items) {
                items = c.items.map((i: any) => {
                    let itemName = [];
                    if(i.name.en) {
                        itemName.push({
                            language_id: "en",
                            value: i.name.en
                        })
                    }
                    if(i.name.es) {
                        itemName.push({
                            language_id: "es",
                            value: i.name.es
                        })
                    }
                    let itemDescription = undefined;
                    if(i.description) {
                        itemDescription = [];
                        if(i.description.en) {
                            itemDescription.push({
                                language_id: "en",
                                value: i.description.en
                            })
                        }
                        if(i.description.es) {
                            itemDescription.push({
                                language_id: "es",
                                value: i.description.es
                            })
                        }
                    }
                    let options = undefined;
                    if(i.options) {
                        options = i.options.map((o: any) => {
                            let optionName = [];
                            if(o.name.en) {
                                optionName.push({
                                    language_id: "en",
                                    value: o.name.en
                                })
                            }
                            if(o.name.es) {
                                optionName.push({
                                    language_id: "es",
                                    value: o.name.es
                                })
                            }
        
                            let choices = undefined;
                            if(o.choices) {
                                choices = o.choices.map((ch: any) => {
                                    let choiceName = [];
                                    if(ch.name.en) {
                                        choiceName.push({
                                            language_id: "en",
                                            value: ch.name.en
                                        })
                                    }
                                    if(ch.name.es) {
                                        choiceName.push({
                                            language_id: "es",
                                            value: ch.name.es
                                        })
                                    }
                                    return {
                                        restaurant_id: index + 1,
                                        option_choices: {
                                            data: [{
                                                name: {
                                                    data: {
                                                        service_provider_id: index + 1,
                                                        service_provider_type: "restaurant",
                                                        translations: {
                                                            data: choiceName
                                                        }
                                                    }
                                                },
                                                restaurant_id: index + 1,
                                                available: ch.available,
                                                cost: ch.cost
                                            }]
                                        }
                                    }
                                    // console.log(JSON.stringify(b))
                                    // return b;
                                })
                            }
                            return {
                                restaurant_id: index + 1,
                                item_options: {
                                    data: [{
                                        name: {
                                            data: {
                                                service_provider_id: index + 1,
                                                service_provider_type: "restaurant",
                                                translations: {
                                                    data: optionName
                                                }
                                            }
                                        },
                                        restaurant_id: index + 1,
                                        option_type: o.optionType,
                                        minimum_choice: o.minimumChoice,
                                        maximum_choice: o.maximumChoice,
                                        free_choice: o.freeChoice,
                                        cost_per_extra: o.costPerExtra,
                                        choices: (choices) ? {
                                            data: choices
                                        }: undefined
                                    }]
                                }
                            }
                            // console.log(JSON.stringify(a))
                            // return a
                        })
                    }
                    // console.log(JSON.stringify(options[0], null, "\t"))
                    return {
                        name: {
                            data: {
                                service_provider_id: index + 1,
                                service_provider_type: "restaurant",
                                translations: {
                                    data: itemName
                                }
                            }
                        },
                        description: itemDescription ? {
                            data: {
                                service_provider_id: index + 1,
                                service_provider_type: "restaurant",
                                translations: {
                                    data: itemDescription
                                }
                            }
                        }: undefined,
                        position: i.position,
                        available: i.available,
                        cost: i.cost,
                        restaurant_id: index + 1,
                        options: (options) ? {
                            data: options
                        }: undefined
                    }
                });
            }
            
            return {
                name: {
                    data: {
                        service_provider_id: index + 1,
                        service_provider_type: "restaurant",
                        translations: {
                            data: name
                        }
                    }
                },
                description: categoryDescription ? {
                    data: {
                        service_provider_id: index + 1,
                        service_provider_type: "restaurant",
                        translations: {
                            data: categoryDescription
                        }
                    }
                }: undefined,
                position: c.position,
                items: (items) ? {
                    data: items
                }: undefined
            }
        })
    }
    
    return {
        id: index + 1,
        firebase_id: r.firebaseId,
        name: r.name,
        image: r.image,
        location_gps: JSON.stringify({
            "type": "point",
            "coordinates": [r.location.lng, r.location.lat]
        }),
        location_text: r.location.address,
        description: {
            data: {
                service_provider_id: index + 1,
                service_provider_type: "restaurant",
                translations: {
                    data: description
                }
            }
        },
        open_status: r.openStatus,
        // language_id: r.languageId,
        approved: r.approved,
        schedule: r.schedule,
        categories: (categories) ? {
            data: categories
        }: undefined
    }
})
    let optionChoiceArray: any[] = [];
    for(let rIdx in restaurants1) {
        let choices: Record<string, any> = {};
        if(restaurants1[rIdx].categories) {
            for(let category of restaurants1[rIdx].categories.data) {
                if(category.items) {
                    for(let item of category.items.data) {
                        if(item.options) {
                            for(let option of item.options.data) {
                                if(option.item_options.data[0].choices) {
                                    for(let choice of option.item_options.data[0].choices.data) {
                                        choices[choice.option_choices.data[0].name.data.translations.data[0].value] = choice.option_choices.data[0];
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        let choicesArray = [];
        for(let choiceName in choices) {
            choicesArray.push(choices[choiceName]);
        }
        console.log(restaurants1[rIdx].name, choicesArray.length)
        let response1 = await chain.mutation({
            insert_restaurant_choice: [{
                objects: choicesArray
            }, {
                returning: {
                    id: true,
                }
            }]
        })
        let count = 0;
        for(let choiceName in choices) {
            choices[choiceName].id = response1.insert_restaurant_choice?.returning[count].id;
            count++;
        }
        if(restaurants1[rIdx].categories) {
            restaurants1[rIdx].categories.data.forEach((c: any, cIdx: number) => {
                if(c.items) {
                    c.items.data.forEach((i: any, iIdx: number) => {
                        if(i.options) {
                            i.options.data.forEach((o: any, oIdx: number) => {
                                if(o.item_options.data[0].choices) {
                                    for(let choice of o.item_options.data[0].choices.data) {
                                        optionChoiceArray.push({
                                            option_id: response[parseInt(rIdx)].insert_restaurant_restaurant_one.categories[cIdx].items[iIdx].options[oIdx].option_id,
                                            choice_id: choices[choice.option_choices.data[0].name.data.translations.data[0].value].id,
                                            restaurant_id: parseInt(rIdx) + 1
                                        })
                                    }
                                }
                            })
                        }
                    })
                }
            })
        }
    }
    // console.log(JSON.stringify(optionChoiceArray))
    await chain.mutation({
        insert_restaurant_option_choice_map: [{
            objects: optionChoiceArray
        }, {
            affected_rows: true
        }]
    })
}
/// [{
        //     id: 
        //     firebase_id: data.firebaseId,
        //     name: data.name,
        //     image: data.image,
        //     location_gps: JSON.stringify({
        //         "type": "point",
        //         "coordinates": [data.location.lng, data.location.lat]
        //     }),
        //     location_text: data.location.address,
        //     description: {
        //         data: {
        //             translations: {
        //                 data: [{
        //                     language_id: "en",
        //                     value: data.details.description.en
        //                 }, {
        //                     language_id: "es",

        //                 }]
        //             }
        //         }
        //     },
        //     items: {
        //         data: [{

        //         }]
        //     },
        //     open_status: "closed_indefinitely",
        //     categories: {
        //         data: [{
        //             name: {
        //                 data: {
        //                     translations: {
        //                         data: [{

        //                         }]
        //                     }
        //                 }
        //             },
        //             description: {
        //                 data: {
        //                     service_provider_id: 4,
        //                     service_provider_type: "restaurant",
        //                     translations: {
        //                         data: [{

        //                         }]
        //                     }
        //                 }
        //             },
        //             items: {
        //                 data: [{
        //                     options: {
        //                         data: [{
        //                             item_options: {
        //                                 data: [{
        //                                     choices: {
        //                                         data: [{
        //                                             option_choices: {
        //                                                 data: [{

        //                                                 }]
        //                                             }
        //                                         }]
        //                                     }
        //                                 }]
        //                             }
        //                         }]
        //                     }
        //                 }]
        //             }
        //         }]
        //     }
        // }]
        