module.exports = {
    devServer:{
        proxy:{
            '/api':{
                target:'http://192.168.31.60:3000',
                changeOrigin:true,
                pathRewrite:{
                    '^/api':"http://192.168.31.60:3000"
                }
            }
        }
    }
}