module FirebaseCloudMessenger
  SCHEMA = {
    "definitions" => {
      "data" => {
        "type" => "object",
        "additionalProperties" => { "type" => "string" }
      },
      "notification" => {
        "type" => "object",
        "properties" => {
          "title" => { "type" => "string" },
          "body"  => { "type" => "string" },
          "image" => { "type" => "string" }
        },
        "additionalProperties" => false
      },
      "android_config" => {
        "type" => "object",
        "properties" => {
          "collapse_key"             => { "type" => "string" },
          "priority"                 => { "type" => "string", "enum" => ["NORMAL", "HIGH"] },
          "ttl"                      => { "type" => "string", "format" => "^[0-9]+\.[0-9]+s$" },
          "restricted_package_name"  => { "type" => "string" },
          "data"                     => { "$ref" => "#/definitions/data" },
          "notification"             => { "$ref" => "#/definitions/android_notification" },
          "fcm_options"              => { "$ref" => "#/definitions/fcm_options" }
        },
        "additionalProperties" => false
      },
      "android_notification" => {
        "type" => "object",
        "properties" => {
          "title"                   => { "type" => "string" },
          "body"                    => { "type" => "string" },
          "channel_id"              => { "type" => "string" },
          "icon"                    => { "type" => "string" },
          "color"                   => { "type" => "string" },
          "sound"                   => { "type" => "string" },
          "tag"                     => { "type" => "string" },
          "click_action"            => { "type" => "string" },
          "body_loc_key"            => { "type" => "string" },
          "body_loc_args"           => { "type" => "array", "items" => { "type" => "string" } },
          "title_loc_key"           => { "type" => "string" },
          "title_loc_args"          => { "type" => "array", "items" => { "type" => "string" } },
          "ticker"                  => { "type" => "string" },
          "sticky"                  => { "type" => "boolean" },
          "event_time"              => { "type" => "string" },
          "local_only"              => { "type" => "boolean" },
          "notification_priority"   => { "type" => "string", "enum" => ["PRIORITY_UNSPECIFIED", "PRIORITY_MIN", "PRIORITY_LOW", "PRIORITY_DEFAULT", "PRIORITY_HIGH", "PRIORITY_HIGH"] },
          "default_sound"           => { "type" => "boolean" },
          "default_vibrate_timings" => { "type" => "boolean" },
          "default_light_settings"  => { "type" => "boolean" },
          "vibrate_timings"         => { "type" => "array", "items" => { "type" => "string" } },
          "visibility"              => { "type" => "string", "enum" => ["VISIBILITY_UNSPECIFIED", "PRIVATE", "PUBLIC", "SECRET"] },
          "notification_count"      => { "type" => "number" },
          "light_settings"          => { "$ref" => "#/definitions/light_settings" },
          "image"                   => { "type" => "string" }
        },
        "additionalProperties" => false
      },
      "light_settings" => {
        "type" => "object",
        "properties" => {
          "color"              => { "$ref" => "#/definitions/color" },
          "light_on_duration"  => { "type" => "string" },
          "light_off_duration" => { "type" => "string" }
        },
        "additionalProperties" => false
      },
      "color" => {
        "type" => "object",
        "properties" => {
          "red"   => { "type" => "number" },
          "green" => { "type" => "number" },
          "blue"  => { "type" => "number" },
          "alpha" => { "type" => "number" }
        },
        "additionalProperties" => false
      },
      "webpush_config" => {
        "type" => "object",
        "properties" => {
          "headers"      => { "$ref" => "#/definitions/data" },
          "data"         => { "$ref" => "#/definitions/data" },
          "notification" => { "$ref" => "#/definitions/webpush_notification" },
          "fcm_options"  => { "$ref" => "#/definitions/webpush_fcm_options" },
        },
        "additionalProperties" => false
      },
      "webpush_notification" => {
        "type" => "object",
        "properties" => {
          "title"          => { "type" => "string" },
          "body"           => { "type" => "string" },
          "icon"           => { "type" => "string" }
        },
        "additionalProperties" => false
      },
      "webpush_fcm_options" => {
        "type" => "object",
        "properties" => {
          "link" => { "type" => "string" }
        },
        "additionalProperties" => false
      },
      "apns" => {
        "type" => "object",
        "properties" => {
          "headers"     => { "$ref" => "#/definitions/data" },
          "payload"     => { "$ref" => "#/definitions/apns_payload" },
          "fcm_options" => { "$ref" => "#/definitions/apns_fcm_options" }
        },
        "additionalProperties" => false
      },
      "fcm_options" => {
        "type" => "object",
        "properties" => {
          "analytics_label" => { "type" => "string" },
        },
        "additionalProperties" => false
      },
      "apns_alert" => {
        "anyOf" => [
          { "type" => "string" },
          {
            "type" => "object",
            "properties" => {
              "title"          => { "type" => "string" },
              "body"           => { "type" => "string" },
              "title-loc-key " => { "anyOf" => [ { "type" => "string" }, { "type" => "null" } ] },
              "title-loc-args" => { "anyOf" => [ { "type" => "array", "items" => { "type" => "string" } }, { "type" => "null" }] },
              "action-loc-key" => { "anyOf" => [ { "type" => "string" }, { "type" => "null" } ] },
              "loc-key"        => { "type" => "string" },
              "loc-args"       => { "type" => "array", "items" => { "type" => "string" } },
              "launch-image"   => { "type" => "string" }
            },
            "additionalProperties" => false
          }
        ]
      },
      "apns_payload" => {
        "type" => "object",
        "properties" => {
          "aps" => { "$ref" => "#/definitions/aps_dictionary" }
        }
      },
      "aps_dictionary" => {
        "type" => "object",
        "properties" => {
          "alert"             => { "$ref" => "#/definitions/apns_alert" },
          "badge"             => { "type" => "number" },
          "sound"             => { "type" => "string" },
          "content-available" => { "type" => "number" },
          "mutable-content"   => { "type" => "number" },
          "category"          => { "type" => "string" },
          "thread-id"         => { "type" => "string" }
        },
        "additionalProperties" => false
      },
      "apns_fcm_options" => {
        "type" => "object",
        "properties" => {
          "analytics_label" => { "type" => "string" },
          "image"           => { "type" => "string" },
        }
      },
    },
    "type" => "object",
    "properties" => {
      "data"         => { "$ref" => "#/definitions/data" },
      "notification" => { "$ref" => "#/definitions/notification" },
      "android"      => { "$ref" => "#/definitions/android_config" },
      "webpush"      => { "$ref" => "#/definitions/webpush_config" },
      "apns"         => { "$ref" => "#/definitions/apns" },
      "token"        => { "type" => "string" },
      "topic"        => { "type" => "string" },
      "condition"    => { "type" => "string" }
    },
    "additionalProperties" => false,
    "oneOf" => [
      { "required" => ["token"] },
      { "required" => ["topic"] },
      { "required" => ["condition"] }
    ]
  }
end
