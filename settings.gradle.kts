pluginManagement {
    repositories {
        gradlePluginPortal()
        maven("https://papermc.io/repo/repository/maven-public/")
    }
}

rootProject.name = "papyrus"

include("papyrus-api", "papyrus-mojangapi", "papyrus-server")
