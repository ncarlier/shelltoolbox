from jabberbot import JabberBot, botcmd
import urlgrabber

def getUptime():
                try:
                        f = open( "/proc/uptime" )
                        contents = f.read().split()
                        f.close()
                except:
                        return "Cannot open uptime file: /proc/uptime"
                total_seconds = float(contents[0])
                # Helper vars:
                MINUTE  = 60
                HOUR    = MINUTE * 60
                DAY     = HOUR * 24
                # Get the days, hours, etc:
                days    = int( total_seconds / DAY )
                hours   = int( ( total_seconds % DAY ) / HOUR )
                minutes = int( ( total_seconds % HOUR ) / MINUTE )
                seconds = int( total_seconds % MINUTE )
                # Build up the pretty string (like this: "N days, N hours, N minutes, N seconds")
                string = ""
                if days> 0:
                        string += str(days) + " " + (days == 1 and "day" or "days" ) + ", "
                if len(string)> 0 or hours> 0:
                        string += str(hours) + " " + (hours == 1 and "hour" or "hours" ) + ", "
                if len(string)> 0 or minutes> 0:
                        string += str(minutes) + " " + (minutes == 1 and "minute" or "minutes" ) + ", "
                string += str(seconds) + " " + (seconds == 1 and "second" or "seconds" )
                return string;

class HelloWorld(JabberBot):
        @botcmd
        def hello(self, mess, args):
                """Display Hello World!"""
                return '%s\n' % 'Hello World!'

        @botcmd
        def uptime(self, mess, args):
                """Return the server uptime"""
                return '%s\n' % getUptime()

        @botcmd
        def ip(self, mess, args):
                """Return the server IP"""
                return '%s\n' % urlgrabber.urlread('http://whatismyip.org')


username = 'nunux@im.apinc.org'
password = 'iamabot!'
bot = HelloWorld(username, password)
bot.serve_forever()
