<template>
  <div>
    <h1 class="regular">{{$t('customer.home.services')}}</h1>
    <section class="flex wrap">
      <router-link
        tag="div"
        to="/services/taxi/request"
        class="panel flex align_center center fill_width wrap bg_taxi"
        id="taxi"
      >
        <taxiIcon class="icon"></taxiIcon>
        <h4>{{$t('customer.home.taxi')}}</h4>
      </router-link>
      <router-link
        tag="div"
        to="/services/grocery/request"
        class="panel flex align_center center fill_width wrap bg_grocery"
        id="groceries"
      >
        <groceriesIcon class="icon"></groceriesIcon>
        <h4>{{$t('customer.home.groceries')}}</h4>
      </router-link>
    </section>
  </div>
</template>

<script>
import taxiIcon from "@/shared/components/SVG/taxi";
import groceriesIcon from "@/shared/components/SVG/groceries";
export default {
  components: {
    taxiIcon,
    groceriesIcon
  },
  data() {
    return {
      isLoading: false,
      error: null
    };
  },
  computed: {
    requestTaxi() {
      return "/services/taxi/request";
    },
    requestGrocery() {
      return "/services/grocery/request";
    }
  }
};
</script>

<style lang="scss" scoped>
.panel {
  height: 8rem;
  border-radius: 12px;
  margin: 1.5rem 0;
  cursor: pointer;
  flex-direction: column;
  justify-content: center;
  h4 {
    width: 100%;
    text-align: center;
  }
  .icon {
    height: 3rem;
    width: auto;
  }
}
</style>
