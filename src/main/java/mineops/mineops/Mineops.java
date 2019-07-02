package mineops.mineops;

import org.bukkit.plugin.java.JavaPlugin;

public final class Mineops extends JavaPlugin {

    @Override
    public void onEnable() {
        // Plugin startup logic
        this.getCommand("mycommand").setExecutor(new CommandKit());
    }

    @Override
    public void onDisable() {
        // Plugin shutdown logic
    }
}

