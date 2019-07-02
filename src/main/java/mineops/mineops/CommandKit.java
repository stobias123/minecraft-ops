package mineops.mineops;

import org.bukkit.command.Command;
import org.bukkit.command.CommandExecutor;
import org.bukkit.command.CommandSender;

public class CommandKit implements CommandExecutor {
    @Override
    public boolean onCommand(CommandSender sender,
                             Command command,
                             String label,
                             String[] args){
        if (command.getName().equalsIgnoreCase("mycommand")) {
            sender.sendMessage("You ran /mycommand!");
            return true;
        }
        return false;
    }
}
