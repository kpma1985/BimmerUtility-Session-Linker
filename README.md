# BU-SESSION-LINKER

## 🇩🇪 Beschreibung (Deutsch)
**BU-SESSION-LINKER** ist ein automatisierter Windows-Batch-Wrapping-Prozess zur effizienten Verwaltung von E-Sys- und BimmerUtility-Sessions.

Das Skript erstellt automatisch:
- Session-Ordner mit Zeitstempel auf dem Desktop
- Symbolische Verknüpfung „latest“ auf den aktuellen Session-Ordner
- Symlinks für die Unterordner `FA`, `SVT` und `TAL` im E-Sys-Verzeichnis
- Umbenennung der originalen E-Sys-Ordner mit dem Prefix `WRAPPER_` zur sicheren Wiederherstellung

### Features:
- Vollautomatische Session-Verwaltung
- Symlink-Erstellung für E-Sys
- Automatisches Umbenennen und Schutz der Original-Daten
- Admin-Rechte-Erkennung und automatischer Neustart
- Direkter Start von BimmerUtility

---

## 🇬🇧 Description (English)
**BU-SESSION-LINKER** is an automated Windows batch wrapper for efficiently managing E-Sys and BimmerUtility sessions.

The script automatically:
- Creates timestamped session folders on the desktop
- Creates a symbolic link "latest" to the current session folder
- Creates symlinks for `FA`, `SVT`, and `TAL` folders inside the E-Sys directory
- Renames the original E-Sys folders with the `WRAPPER_` prefix for safe restoration

### Features:
- Fully automated session management
- Symlink creation for E-Sys
- Automatic backup and protection of original data
- Admin rights detection and automatic restart
- Direct launch of BimmerUtility
