module.exports = {
    //2021-04-25 vue-spring 연동test
    outputDir: "../KnockKnock/src/main/webapp/WEB-INF/views",  
    indexPath: "../index.html",  
    devServer: {  
      proxy: "http://localhost:8080"  
    },  
    chainWebpack: config => {  
      const svgRule = config.module.rule("svg");    
      svgRule.uses.clear();    
      svgRule.use("vue-svg-loader").loader("vue-svg-loader");  
    }
  };
  