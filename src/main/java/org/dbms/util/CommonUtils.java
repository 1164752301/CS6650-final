package org.dbms.util;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.config.RequestConfig;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.client.utils.URIBuilder;
import org.apache.http.config.SocketConfig;
import org.apache.http.entity.ContentType;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.impl.conn.PoolingHttpClientConnectionManager;
import org.apache.http.util.EntityUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.StringUtils;

import java.io.IOException;
import java.net.URISyntaxException;
import java.nio.charset.StandardCharsets;
import java.util.Map;

public class CommonUtils {
    private static final Logger logger = LoggerFactory.getLogger(CommonUtils.class);
    
    public static String postCommon(
            String url, Map<String, String> params, String body, ContentType contentType) {
            PoolingHttpClientConnectionManager cManager = getConnectionManager();
            CloseableHttpClient client = HttpClients.custom().setConnectionManager(cManager).build();

        URIBuilder uriBuilder = null;
        try {
            uriBuilder = new URIBuilder(url);
        } catch (URISyntaxException e) {
            e.printStackTrace();
        }
        if (params != null) {
                for (Map.Entry param : params.entrySet()) {
                    uriBuilder.addParameter((String) param.getKey(), (String) param.getValue());
                }
            }

        HttpPost post = null;
        try {
            post = new HttpPost(uriBuilder.build());
        } catch (URISyntaxException e) {
            e.printStackTrace();
        }
        post.setConfig(createRequestConfig());

            if (StringUtils.isEmpty(body) == false) {
                if (contentType == null) {
                    post.addHeader("Content-Type", ContentType.APPLICATION_JSON.toString());
                } else {
                    post.addHeader("Content-Type", contentType.toString());
                }
                HttpEntity entity = new StringEntity(body, StandardCharsets.UTF_8);
                post.setEntity(entity);
            }

            try {
                String result = null;
                HttpResponse response = client.execute(post);
                int statusCode = response.getStatusLine().getStatusCode();
                if (statusCode == 200) {
                    HttpEntity resEntity = response.getEntity();
                    if (resEntity != null) {
                        result = EntityUtils.toString(resEntity, StandardCharsets.UTF_8);
                    }
                    return result;
                } else {
                    HttpEntity resEntity = response.getEntity();
                    if (resEntity != null) {
                        result = EntityUtils.toString(resEntity, StandardCharsets.UTF_8);
                    }
                    logger.error(
                            String.format("fail：%s，code：%d，cause：%s", url, statusCode, result == null ? "" : result));
                }
            } catch (Exception e) {
                logger.error(String.format("Cannot connect to %s", url));
            }
            return "";
    }

    private static PoolingHttpClientConnectionManager getConnectionManager() {
        PoolingHttpClientConnectionManager cManager = new PoolingHttpClientConnectionManager();
        cManager.setValidateAfterInactivity(2000);
        cManager.setDefaultSocketConfig(SocketConfig.custom().setSoTimeout(2000).build());
        cManager.setValidateAfterInactivity(2000);
        return cManager;
    }

    private static RequestConfig createRequestConfig() {
        RequestConfig config =
                RequestConfig.custom()
                        .setSocketTimeout(2000)
                        .setConnectTimeout(2000)
                        .setConnectionRequestTimeout(2000)
                        .build();
        return config;
    }
}
