plugins {
    id("com.android.application")
    id("com.google.gms.google-services") // Esse plugin é adicionado diretamente aqui
    id("kotlin-android")
    id("dev.flutter.flutter-gradle-plugin")
}

android {
    namespace = "com.example.meu_app"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = flutter.ndkVersion
    ndkVersion = "27.0.12077973" // Adicionando a versão do NDK

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
        isCoreLibraryDesugaringEnabled = true // Ativa o desugaring
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_11.toString()
    }

    defaultConfig {
        applicationId = "com.example.meu_app"
        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    buildTypes {
        release {
            signingConfig = signingConfigs.getByName("debug")
            isShrinkResources = false // Corrigido
            isMinifyEnabled = false // Corrigido
        }
    }
}

dependencies {
    implementation("org.jetbrains.kotlin:kotlin-stdlib:1.9.10")
    implementation("com.google.firebase:firebase-auth")
    implementation("com.google.firebase:firebase-messaging")
    implementation("com.google.firebase:firebase-firestore")
    implementation("com.google.android.gms:play-services-auth:20.2.0")

    // Adicionando a dependência de desugaring
    coreLibraryDesugaring("com.android.tools:desugar_jdk_libs:1.2.2")
}

flutter {
    source = "../.."
}
