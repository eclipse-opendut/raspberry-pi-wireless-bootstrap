use clap::Parser;
use tracing_subscriber::fmt::format::FmtSpan;

fn main() -> anyhow::Result<()> {
    tracing_subscriber::fmt()
        .with_env_filter("raspberry_pi_wireless_bootstrap=trace")
        .with_span_events(FmtSpan::ENTER | FmtSpan::CLOSE)
        .with_writer(std::io::stderr) //allows piping stdout from task output without tracing interfering
        .init();

    raspberry_pi_wireless_bootstrap::RaspberryPiCli::parse()
        .run()
}
