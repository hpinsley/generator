namespace api
{
    public class MailServerConfig {

        public MailServerConfig()
        {
            this.Host = "mail";
            this.Port = 1025;
        }

        public string Host { get; set; }
        public int Port { get; set; }
    }
}