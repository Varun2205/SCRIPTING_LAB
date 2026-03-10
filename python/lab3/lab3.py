import re
def extract_sta_info(report_path):
    with open(report_path, "r", encoding="utf-8", errors="ignore") as f:
        text = f.read()
        startpoint = re.search(r"Startpoint:\s*(.+)", text)
        endpoint = re.search(r"Endpoint:\s*(.+)", text)
        library = re.search(r"Library:\s*(.+)", text)
        arrival = re.search(r"data arrival time\s+([\-]?\d+\.\d+)", text)
        required = re.search(r"data required time\s+([\-]?\d+\.\d+)", text)
        slack = re.search(r"slack\s*\(\w+\)\s+([\-]?\d+\.\d+)", text)
        info = {
        "Startpoint": startpoint.group(1).strip() if startpoint else "Not found",
        "Endpoint": endpoint.group(1).strip() if endpoint else "Not found",
        "Library": library.group(1).strip() if library else "Not found",
        "Arrival Time": float(arrival.group(1)) if arrival else None,
        "Required Time": float(required.group(1)) if required else None,
        "Slack": float(slack.group(1)) if slack else None,
        }
        if info["Slack"] is not None:
            info["Timing Status"] = "MET" if info["Slack"] >= 0 else "VIOLATED"
        else:
            info["Timing Status"] = "UNKNOWN"
    return info
if __name__ == "__main__":
    report_file = "aes_ip_HVT_delay.log"
    result = extract_sta_info(report_file)
    print("Extracted STA Information")
    print("-" * 40)
    for key, value in result.items():
        print(f"{key}: {value}")