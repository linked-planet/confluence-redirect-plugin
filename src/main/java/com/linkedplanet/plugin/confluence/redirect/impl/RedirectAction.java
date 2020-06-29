/*-
 * #%L
 * confluence-redirect-plugin
 * %%
 * Copyright (C) 2019 The Plugin Authors
 * %%
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 * #L%
 */
package com.linkedplanet.plugin.confluence.redirect.impl;

import com.atlassian.confluence.core.ConfluenceActionSupport;
import com.opensymphony.xwork.Action;

import javax.inject.Inject;

public class RedirectAction extends ConfluenceActionSupport {

    private String url;
    private PluginConfig pluginConfig;
    private UrlValidationService urlValidationService;

    @SuppressWarnings("unused") // called by dependency injection
    @Inject
    public RedirectAction(PluginConfig pluginConfig, UrlValidationService urlValidationService) {
        this.pluginConfig = pluginConfig;
        this.urlValidationService = urlValidationService;
    }

    @SuppressWarnings("unused") // sdk needs it
    public RedirectAction() {
    }

    @Override
    public String execute() {
        url = pluginConfig.getTargetUrl();
        if (urlValidationService.isValid(url)) {
            return Action.SUCCESS;
        } else {
            return Action.ERROR;
        }
    }

    public String getUrl() {
        return url;
    }

}
