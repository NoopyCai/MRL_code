function() {
    var designerNames = {
        "AlexMoran": "點我看更多_Alex Moran",
        "Alison": "點我看更多_Alison",
        "MortenGeorgsen": "點我看更多_Morten Georgsen",
        "Nordvink": "點我看更多_Nordvink",
        "SaysWho": "點我看更多_Says Who",
        "Steffensen&WUrtz": "點我看更多_Steffensen & WUrtz"
    };

    var designerName = {{Click Element}}.getAttribute('ga-designer-name');
    return designerNames[designerName] || null;
}