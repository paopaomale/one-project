package com.alibaba.weex;

import android.app.Application;
import android.util.Log;

import com.alibaba.weex.commons.adapter.ImageAdapter;
import com.alibaba.weex.commons.util.AppConfig;
import com.alibaba.weex.extend.module.WXEventModule;
import com.alibaba.weex.pluginmanager.PluginManager;
import com.alibaba.weex.svg.component.WXSvgCircle;
import com.alibaba.weex.svg.component.WXSvgContainer;
import com.alibaba.weex.svg.component.WXSvgDefs;
import com.alibaba.weex.svg.component.WXSvgEllipse;
import com.alibaba.weex.svg.component.WXSvgLine;
import com.alibaba.weex.svg.component.WXSvgLinearGradient;
import com.alibaba.weex.svg.component.WXSvgPath;
import com.alibaba.weex.svg.component.WXSvgPolyLine;
import com.alibaba.weex.svg.component.WXSvgPolygon;
import com.alibaba.weex.svg.component.WXSvgRadialGradient;
import com.alibaba.weex.svg.component.WXSvgRect;
import com.alibaba.weex.svg.component.WXSvgStop;
import com.facebook.drawee.backends.pipeline.Fresco;
import com.taobao.weex.InitConfig;
import com.taobao.weex.WXEnvironment;
import com.taobao.weex.WXSDKEngine;
import com.taobao.weex.common.WXException;

public class WXApplication extends Application {

  @Override
  public void onCreate() {
    super.onCreate();
    initDebugEnvironment(true, false, "30.30.28.26");
    WXSDKEngine.addCustomOptions("appName", "WXSample");
    WXSDKEngine.addCustomOptions("appGroup", "WXApp");
    WXSDKEngine.initialize(this,
        new InitConfig.Builder()
            .setImgAdapter(new ImageAdapter())
            .build()
    );
    try {
      WXSDKEngine.registerComponent("radialGradient", WXSvgRadialGradient.class);
      WXSDKEngine.registerComponent("stop", WXSvgStop.class);
      WXSDKEngine.registerComponent("linearGradient", WXSvgLinearGradient.class);
      WXSDKEngine.registerComponent("defs", WXSvgDefs.class);
      WXSDKEngine.registerComponent("polyline", WXSvgPolyLine.class);
      WXSDKEngine.registerComponent("polygon", WXSvgPolygon.class);
      WXSDKEngine.registerComponent("ellipse", WXSvgEllipse.class);
      WXSDKEngine.registerComponent("rect", WXSvgRect.class);
      WXSDKEngine.registerComponent("line", WXSvgLine.class);
      WXSDKEngine.registerComponent("circle", WXSvgCircle.class);
      WXSDKEngine.registerComponent("path", WXSvgPath.class);
      WXSDKEngine.registerComponent("svg", WXSvgContainer.class);
    } catch (WXException e) {
      e.printStackTrace();
    }

    Fresco.initialize(this);
    AppConfig.init(this);
    PluginManager.init(this);
  }

  /**
   * @param enable enable remote debugger. valid only if host not to be "DEBUG_SERVER_HOST".
   *               true, you can launch a remote debugger and inspector both.
   *               false, you can  just launch a inspector.
   * @param host   the debug server host, must not be "DEBUG_SERVER_HOST", a ip address or domain will be OK.
   *               for example "127.0.0.1".
   */
  private void initDebugEnvironment(boolean connectable,boolean enable, String host) {
    if (!"DEBUG_SERVER_HOST".equals(host)) {
      WXEnvironment.sDebugServerConnectable = connectable;
      WXEnvironment.sRemoteDebugMode = enable;
      WXEnvironment.sRemoteDebugProxyUrl = "ws://" + host + ":8088/debugProxy/native";
    }
  }

}
