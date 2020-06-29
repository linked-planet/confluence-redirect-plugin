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
package com.linkedplanet.plugin.confluence.redirect.impl

import com.atlassian.plugin.spring.scanner.annotation.imports.ComponentImport
import com.atlassian.sal.api.pluginsettings.PluginSettings
import com.atlassian.sal.api.pluginsettings.PluginSettingsFactory
import com.linkedplanet.plugin.confluence.redirect.api.PluginComponent.Companion.PLUGIN_ID
import javax.inject.Inject
import javax.inject.Named

@Named
class PluginConfig
@Inject constructor(@ComponentImport private val pluginSettingsFactory: PluginSettingsFactory) {

    companion object {
        private const val PLUGIN_STORAGE_KEY = "$PLUGIN_ID.pluginsettings"

        const val CONFIG_TARGET_URL = "targetUrl"
    }

    private val pluginSettings: PluginSettings = pluginSettingsFactory.createGlobalSettings()

    var targetUrl: String?
        get() = getValue(CONFIG_TARGET_URL)
        set(value) = putValue(CONFIG_TARGET_URL, value)

    // ----------------------------------------------------------------------
    // Utilities
    // ----------------------------------------------------------------------

    @Suppress("SameParameterValue")
    private fun getValue(key: String): String? {
        return pluginSettings.get("$PLUGIN_STORAGE_KEY.$key") as String?
    }

    @Suppress("SameParameterValue")
    private fun putValue(key: String, value: Any?) {
        val storageValue = value?.toString() ?: ""
        pluginSettings.put("$PLUGIN_STORAGE_KEY.$key", storageValue)
    }

}
