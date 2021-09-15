echo "
BOT_TOKEN = $bot_token
GDRIVE_FOLDER_ID = $gdrive_folder_id
OWNER_ID = $owner_id
DOWNLOAD_DIR = "/usr/src/app/downloads"
DOWNLOAD_STATUS_UPDATE_INTERVAL = 5
AUTO_DELETE_MESSAGE_DURATION = 20
IS_TEAM_DRIVE = $is_team_drive
TELEGRAM_API = $telegram_api_id
TELEGRAM_HASH = $telegram_api_hash
DATABASE_URL = ""
AUTHORIZED_CHATS = $authorized_chats  # Split by space
SUDO_USERS = $sudo_users  # Split by space
IGNORE_PENDING_REQUESTS = ""
USE_SERVICE_ACCOUNTS = $use_service_accounts
INDEX_URL = ""
STATUS_LIMIT = 4  # Recommend limit status to 4 tasks
UPTOBOX_TOKEN = ""
MEGA_API_KEY = $mega_api_key
MEGA_EMAIL_ID = $mega_email_id
MEGA_PASSWORD = $mega_password
BLOCK_MEGA_FOLDER = "" 
BLOCK_MEGA_LINKS = ""
STOP_DUPLICATE = ""
SHORTENER = ""
SHORTENER_API = ""
IS_VPS = ""  # Don't set this to True even if VPS, unless facing error with web server
SERVER_PORT = "80"  # Only if IS_VPS is True
BASE_URL_OF_BOT = ""  # Web Link, Required for Heroku to avoid sleep or use worker if you don't want to use web (selection)
ACCOUNTS_ZIP_URL = $accounts_zip_url
TOKEN_PICKLE_URL = $token_pickle_url
MULTI_SEARCH_URL = "N"  
TORRENT_DIRECT_LIMIT = ""
TAR_UNZIP_LIMIT = ""
CLONE_LIMIT = $clone_limit 
MEGA_LIMIT = $mega_limit
HEROKU_API_KEY = ""
HEROKU_APP_NAME = ""
VIEW_LINK = ""
BUTTON_FOUR_NAME = $button_four_name
BUTTON_FOUR_URL = $button_four_url
BUTTON_FIVE_NAME = $button_five_name
BUTTON_FIVE_URL = $button_five_url
BUTTON_SIX_NAME = $button_six_name
BUTTON_SIX_URL = $button_six_url" > "config.env"

if [[ -n $accounts_zip_url ]]; then
	wget -q $accounts_zip_url
	unzip accounts.zip
	rm accounts.zip
fi

gunicorn wserver:start_server --bind 0.0.0.0:$PORT --worker-class aiohttp.GunicornWebWorker & ./aria.sh; python3 -m bot 
