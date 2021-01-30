import Vue from 'vue'
import VueRouter from 'vue-router'

import Home from '../views/Home.vue'
import index from '../views/index.vue'
import login from '../components/login.vue'
import register from '../components/register.vue'
import userinfo from '../components/userinfo.vue'
import Cookie from "js-cookie"
//模板
import zong_plan from '../components/plan/zong_plan.vue'
import plan_btn from "../components/plan/plan_btn.vue"
import xuyong_plan from '../components/xyplan/xuyong_plan.vue'
import xyplan_btn from "../components/xyplan/xyplan_btn.vue"
import htpz from '../components/htpz/htpz.vue'
import htpz_btn from "../components/htpz/htpz_btn.vue"
import clrc from '../components/clrc/clrc.vue'
import clrc_btn from "../components/clrc/clrc_btn.vue"
import delivery from '../components/delivery/delivery.vue'
import delivery_btn from "../components/delivery/delivery_btn.vue"
import content from '../components/content/content.vue'
import content_btn from "../components/content/content_btn.vue"
import vendor from '../components/vendor/vendor.vue'
import vendor_btn from "../components/vendor/vendor_btn.vue"
import basicmaterials from '../components/basicmaterials/basicmaterials.vue'
import basicmaterials_btn from "../components/basicmaterials/basicmaterials_btn.vue"
import warehouse from '../components/warehouse/warehouse.vue'
import warehouse_btn from "../components/warehouse/warehouse_btn.vue"
import contract from '../components/contract/contract.vue'
import contract_btn from "../components/contract/contract_btn.vue"

Vue.use(VueRouter)

const notFound = {
  template: `<div><h1>页面丢失</h1></div>`
}

const routes = [
  {
    path: '/',
    redirect: "/index"
  },
  {
    path: '/index',
    name: 'index',
    component: index,
    children: [
      {
        path: "zong_plan",
        name: "zong_plan",
        component: zong_plan
      },
      {
        path: "plan_btn/:id",
        name: "plan_btn",
        component: plan_btn
      }, 
      {
        path: "xuyong_plan",
        name: "xuyong_plan",
        component: xuyong_plan
      },
      {
        path: "xyplan_btn/:id",
        name: "xyplan_btn",
        component: xyplan_btn
      }, 
      {
        path: "htpz",
        name: "htpz",
        component: htpz
      },
      {
        path: "htpz_btn/:id",
        name: "htpz_btn",
        component: htpz_btn
      }, 
      {
        path: "clrc",
        name: "clrc",
        component: clrc
      },
      {
        path: "clrc_btn/:id",
        name: "clrc_btn",
        component: clrc_btn
      }, 
      {
        path: "delivery",
        name: "delivery",
        component: delivery
      },
      {
        path: "delivery_btn/:id",
        name: "delivery_btn",
        component: delivery_btn
      }, 
      {
        path: "content",
        name: "content",
        component: content
      },
      {
        path: "content_btn/:id",
        name: "content_btn",
        component: content_btn
      }, 
      {
        path: "vendor",
        name: "vendor",
        component: vendor
      },
      {
        path: "vendor_btn/:id",
        name: "vendor_btn",
        component: vendor_btn
      }, 
      {
        path: "basicmaterials",
        name: "basicmaterials",
        component: basicmaterials
      },
      {
        path: "basicmaterials_btn/:id",
        name: "basicmaterials_btn",
        component: basicmaterials_btn
      }, 
      {
        path: "warehouse",
        name: "warehouse",
        component: warehouse
      },
      {
        path: "warehouse_btn/:id",
        name: "warehouse_btn",
        component: warehouse_btn
      }, 
      {
        path: "contract",
        name: "contract",
        component: contract
      },
      {
        path: "contract_btn/:id",
        name: "contract_btn",
        component: contract_btn
      }, 
    ]
  },
  {
    path: '/login',
    name: 'login',
    component: login
  },
  {
    path: '/register',
    name: 'register',
    component: register
  },
  {
    path: '/userinfo',
    name: 'userinfo',
    component: userinfo
  },
  {
    path: '/about',
    name: 'About',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "about" */ '../views/About.vue')
  },
  //路由重定向
  // {
  //   path: "*",
  //   component: notFound,
  //   redirect(to) {
  //     // console.log(to);
  //     if (to.path === "/aaa") {
  //       return 'index'
  //     } else if (to.path === "/bbb") {
  //       return "index"
  //     } 
  //   }
  // }
]

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})

//login   路由守卫
// router.beforeEach((to,from,next)=>{
//   if(to.path === "/login" || to.path === "/register") {
//     next()
//   } else {
//     let token = Cookie.get("token");
//     if (token === null || token === "") {
//       next("/login");
//     }
//   }
// });
export default router
