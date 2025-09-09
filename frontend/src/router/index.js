import {createRouter, createWebHistory} from 'vue-router'
import { jwtDecode } from 'jwt-decode'; // Precisamos do jwtDecode aqui também


import HomeView from '../views/HomeView.vue'
import RegisterView from '../views/RegisterView.vue' 
import LoginView from '../views/LoginView.vue'
import MainView from '../views/MainView.vue'
import PlaceholderView from '@/views/PlaceholderView.vue'
import AdminPlaceholderView from '@/views/AdminPlaceholderView.vue'
import QuestionCreateView from '@/views/QuestionCreateView.vue'
import StartSimuladoView from '@/views/StartSimuladoView.vue';
import SimuladoTempView from '@/views/SimuladoTempView.vue';
import SimuladoView from '../views/SimuladoView.vue'
import SimuladoResultadosView from '../views/SimuladoResultadosView.vue';
import SimuladoHistoryView from '../views/SimuladoHistoryView.vue'; 



const router = createRouter({
    history: createWebHistory(import.meta.env.BASE_URL),
routes:[
    {
        path:'/',
        name:'home',
        component: HomeView
    },
    {
      path: '/register',
      name: 'register',
      component: RegisterView // Adicionar a rota de cadastro
    },
    {
      path: '/login',
      name: 'login',
      component: LoginView // Adicionar a rota de cadastro
    },
    {
        path:'/main',
        name:'/main',
        component:MainView,
        meta:{requiresAuth: true}
    },
    {
        path:'/simulado',
        name:'simulado',
        component:StartSimuladoView,
        meta: {requiresAuth:true}
    },
    {
        path:'/simulado-run',
        name:'simulado-run',
        component:SimuladoView,
        meta:{requiresAuth:true}
    },
    {
      path: '/simulado-temp',
      name: 'simulado-temp',
      component: SimuladoTempView,
      meta: { requiresAuth: true }
    },
    {
        path:'/historico',
        name:'historico',
        component:PlaceholderView,
        meta:{requiresAuth:true}
    },
    {
        path:'/admin/questoes',
        name:'admin-questoes',
        component:QuestionCreateView,
        meta:{requiresAuth:true, requiresAdmin:true}
    },
    {
    path: '/simulado/resultados',
    name: 'simulado-resultados',
    component: SimuladoResultadosView
  },
  {
    path: '/simulado/history',
    name: 'simulado-history',
    component: SimuladoHistoryView
  },
]
})

router.beforeEach((to, from, next)=>{
    const token = localStorage.getItem('token')
    const requiresAuth = to.matched.some(record => record.meta.requiresAuth)
    const requiresAdmin = to.matched.some(record => record.meta.requiresAdmin)

    if(requiresAuth && !token){
        next('/login')
    }else if(requiresAdmin && token){
        try{
            const decoded = jwtDecode(token)
            if(decoded.tipo_acesso==='admin'){
                next()
            }else{
                next('/main')
            }
        }catch(error){
            console.error('Falha ao decodificar o token: ',error)
            localStorage.removeItem('token')
            next('/login')
        }
    }else{
        next()
    }
})

export default router