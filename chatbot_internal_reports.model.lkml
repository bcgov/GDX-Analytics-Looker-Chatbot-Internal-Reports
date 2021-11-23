connection: "redshift_pacific_time"
# Set the week start day to Sunday. Default is Monday
week_start_day: sunday

include: "/Views/chatbot_internal_reports.view"                # include all views in the views/ folder in this project

explore: chatbot_internal_reports {}
