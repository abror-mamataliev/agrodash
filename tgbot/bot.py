from decouple import config
from telebot import TeleBot, types
import requests


bot = TeleBot(config('TELEGRAM_BOT_TOKEN'))


@bot.message_handler(commands=["start"])
def start(message):
    keyboard = types.ReplyKeyboardMarkup()
    keyboard.add(
        types.KeyboardButton("Ro'yhatdan o'tish")
    )
    bot.send_message(message.chat.id, "Assalomu alaykum\nAgro Dash portaliga xush kelibsiz", reply_markup=keyboard)


@bot.message_handler(content_types=["text"])
def message(message):
    if message.text == "Ro'yhatdan o'tish":
        text = """
Quyidagi ma'lumotlarni kiriting:
            
- Ism
- Familiya
- Telefon raqam
- Fermer xo'jaligi raqami
"""
        bot.send_message(message.chat.id, text, reply_markup=types.ReplyKeyboardRemove())
        text = """
Ma'lumotlarni quyidagi shablonga o'xshatib kiriting:

Ulug'bek
Abdusamatov
+998938848100
174
"""
        bot.send_message(message.chat.id, text)
    else:
        msg = message.text.split("\n")
        response = requests.get("http://localhost:8000/api/farm?farm_id=%s" % msg[3]).json()
        if not response['exists']:
            response = requests.post("http://localhost:8000/api/register/", data={
                'first_name': msg[0],
                'last_name': msg[1],
                'username': msg[2],
                'farm_id': msg[3]
            }).json()
            print(response)
            text = """
Siz ro'yhatdan muvaffaqiyatli o'tdingiz

agrodash.uz saytiga kirish uchun ma'lumotlar:
<b>Username</b>: %s
<b>Parol</b>: password
""" % (msg[2])
        else:
            text = "Siz allaqachon tizimda mavjudsiz"
        bot.send_message(message.chat.id, text, parse_mode="HTML")


if __name__ == "__main__":
    bot.polling(True, True)
