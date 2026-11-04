
plugins {
    id("com.android.application")

    // Firebase
    id("com.google.gms.google-services")

    // Kotlin
    id("org.jetbrains.kotlin.android")

    // Flutter
    id("dev.flutter.flutter-gradle-plugin")
}

android {
    namespace = "com.example.movie_app"

    compileSdk = flutter.compileSdkVersion
    ndkVersion = flutter.ndkVersion

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }
       
    defaultConfig {
        applicationId = "com.example.movie_app"

        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion

        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    buildTypes {
        release {
            // Debug signing for local testing
            signingConfig = signingConfigs.getByName("debug")
        }
    }
     flavorDimensions += "default"
    productFlavors {
        create("development") {
            dimension = "default"
            applicationIdSuffix = ".dev"
            resValue("string", "app_name", "movie_app dev")
            
        }
        create("production") {
            dimension = "default"
            applicationIdSuffix = ".prod"
            resValue("string", "app_name", "movie_app prod")
        }
    }
}

kotlin {
    compilerOptions {
        jvmTarget.set(
            org.jetbrains.kotlin.gradle.dsl.JvmTarget.JVM_17
        )
    }
}

flutter {
    source = "../.."
}
