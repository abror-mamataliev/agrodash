from decouple import config
from telebot import TeleBot


bot = TeleBot(config('TELEGRAM_BOT_TOKEN'))


@bot.message_handler(commands=["start"])
def start(message):
    bot.send_message(message.chat.id, "This is Agro Dash bot")


if __name__ == "__main__":
    bot.polling(True, True)
