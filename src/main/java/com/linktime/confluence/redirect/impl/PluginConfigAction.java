package com.linktime.confluence.redirect.impl;

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

import com.atlassian.confluence.core.ConfluenceActionSupport;
import com.opensymphony.xwork.Action;

import javax.inject.Inject;

import static org.apache.commons.lang3.StringUtils.isBlank;

public class PluginConfigAction extends ConfluenceActionSupport {

    private String targetUrl;

    private PluginConfig pluginConfig;
    private UrlValidationService urlValidationService;

    @SuppressWarnings("unused") // called by dependency injection
    @Inject
    public PluginConfigAction(PluginConfig pluginConfig, UrlValidationService urlValidationService) {
        this.pluginConfig = pluginConfig;
        this.urlValidationService = urlValidationService;

        this.targetUrl = pluginConfig.getTargetUrl() != null ? pluginConfig.getTargetUrl() : "";
    }

    @SuppressWarnings("unused") // sdk needs it
    public PluginConfigAction() {
    }

    @Override
    public void validate() {
        addFieldErrorIfBlank(PluginConfig.CONFIG_TARGET_URL, targetUrl);
        if (!urlValidationService.isValid(targetUrl)) {
            addFieldError(PluginConfig.CONFIG_TARGET_URL, PluginConfig.CONFIG_TARGET_URL + " is not a valid URL.");
        }
    }

    @SuppressWarnings("SameParameterValue")
    private void addFieldErrorIfBlank(String configKey, String value) {
        if (isBlank(value)) {
            addFieldError(configKey, configKey + " is required.");
        }
    }

    @Override
    public String execute() {
        validate();
        if (hasErrors()) {
            return Action.INPUT;
        } else {
            pluginConfig.setTargetUrl(targetUrl);
            return Action.SUCCESS;
        }
    }

    @SuppressWarnings("unused") // velocity
    public String getTargetUrl() {
        return targetUrl;
    }

    @SuppressWarnings("unused") // velocity
    public void setTargetUrl(String targetUrl) {
        this.targetUrl = targetUrl;
    }
}
