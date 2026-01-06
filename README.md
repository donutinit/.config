# Configuración Debian Para HP Mini 110-3000 (Atom N450)

Objetivo: instalación Debian mínima + Xorg + i3 + LightDM + utilidades para uso diario en hardware de bajos recursos.

## 0) Supuestos Y Notas De Hardware

Equipo: HP Mini 110-3000, en este hardware el rendimiento depende mucho de evitar compositing pesado (blur/shadows), usar paquetes mínimos y evitar desktop environments completos si no son necesarios.

## 1) Instalación Base (sin Entorno gráfico)

1) Instala Debian desde netinst.
2) En “software selection”, dejé solo lo mínimo (“standard system utilities”). Naada de GNOME/KDE/XFCE completos.

## 2) Preparar APT Y Sudo

Actualiza índices e instala sudo:

```sh
su -
apt update
apt install sudo
```

Agrega tu usuario al grupo sudo (reemplaza `TU_USUARIO`):

```sh
usermod -aG sudo TU_USUARIO
```

Cierra sesión y vuelve a entrar para que aplique.

## 3) Instalar Paquetes (Xorg + I3 + LightDM + utilidades)

### 3.1 Instalación Principal

Ejecuta como root (`su -`) o con sudo.

```sh
apt install sudo i3-wm xorg i3status i3lock lightdm
```

```sh
apt install x11-server-utils dbus-x11 xinit lightdm-gtk-greeter xclip picom xinput
```

```sh
apt install network-manager nm-tray unzip p7zip-full unrar-free wget curl git ca-certificates chrony acpid pipewire wireplumber pipewire-audio pavucontrol rofi polkitd lxpolkit thunar thunar-archive-plugin file-roller feh upower brightnessctl bluetooth bluez blueman intel-microcode xterm flatpak fish lm-sensors lightdm-gtk-greeter-settings xfce4-settings xfce4-power-manager nm-connection-editor golang-go gnome-keyring libpam-gnome-keyring seahorse libsecret-1-0 libsecret-1-dev libglib2.0-dev build-essential pkg-config tar npm nodejs fastfetch redshift redshift-gtk mesa-utils xserver-xorg-video-intel libreoffice
```

## 4) Servicios: Habilitar Lo Esencial

```sh
sudo systemctl enable NetworkManager
sudo systemctl enable lightdm
sudo systemctl enable chrony
sudo systemctl enable bluetooth
```

## 5) NetworkManager: Wi-Fi “unmanaged” Y GUI

### 5.1 Estado Rápido

```sh
nmcli general status
nmcli dev status
```

Si ves el Wi-Fi como `unmanaged`, lo más común es que esté siendo manejado por `/etc/network/interfaces` (ifupdown) o por configuración de NetworkManager.

1) Deja `/etc/network/interfaces` solo con loopback:

```sh
sudo nano /etc/network/interfaces
```

Contenido recomendado:

```txt
auto lo
iface lo inet loopback
```

2) Revisa `/etc/NetworkManager/NetworkManager.conf`:

```sh
sudo nano /etc/NetworkManager/NetworkManager.conf
```

Asegura:

```txt
[ifupdown]
managed=true
```

3) Reinicia NetworkManager:

```sh
sudo systemctl restart NetworkManager
nmcli dev status
```

### 5.2 Conectarte Con Interfaz Gráfica

Opciones:
- `nm-connection-editor` (GUI de conexiones)
- `nm-tray` (ícono en tray para conectar rápido)

En i3, normalmente corres `nm-tray` al inicio (ver sección i3 autostart).

## 6) LightDM + Greeter (auto-login Y wallpaper)

### 6.1 Auto-login

Edita:

```sh
sudo nano /etc/lightdm/lightdm.conf
```

Ejemplo (ajusta `TU_USUARIO`):

```ini
[Seat:*]
greeter-session=lightdm-gtk-greeter
autologin-user=diego
autologin-user-timeout=0
```

### 6.2 Wallpaper Del Greeter (y permisos)

El greeter necesita leer la imagen. Paths típicos accesibles:
- `/usr/share/images/`

```sh
sudo mkdir -p /usr/local/share/images
sudo cp 1.jpg /usr/local/share/images/
sudo chmod 644 /usr/local/share/images/*.jpg
```
Config del greeter:

```sh
sudo nano /etc/lightdm/lightdm-gtk-greeter.conf
```

Ejemplo:

```ini
[greeter]
background=/usr/local/share/images/1.jpg
```

## 7) I3: Autostart Mínimo Recomendado

Archivo:

```sh
nano ~/.config/i3/config
```

Ejemplo de líneas útiles:

```txt
exec --no-startup-id nm-tray
exec --no-startup-id lxpolkit
exec --no-startup-id xfce4-power-manager
exec --no-startup-id blueman-applet
exec --no-startup-id picom --config ~/.config/picom/picom.conf
exec --no-startup-id redshift-gtk
```

## 8) Bloqueo De Pantalla Y Suspensión (LightDM greeter)

1) Instala `light-locker`:

```sh
sudo apt install light-locker
```

2) Lánzalo en sesión (i3 autostart):

```txt
exec --no-startup-id light-locker
```

3) Si herramientas de XFCE te siguen tirando el warning, instala `xfce4-session` (trae `xflock4`):

```sh
sudo apt install xfce4-session
```

## 10) Picom En Atom N450

Crea el archivo:

```sh
mkdir -p ~/.config/picom
nano ~/.config/picom/picom.conf
```

Config base ligera (XRender):

```ini
backend = "xrender";
vsync = false;
shadow = false;
fading = false;
inactive-opacity = .65;
active-opacity = .65;
frame-opacity = 1.0;
blur-method = "kernel";
blur-kern = "5x5box";
blur-background = false;
```

Y lánzalo desde i3:

```txt
exec --no-startup-id picom --config ~/.config/picom/picom.conf
```

## 11) Fuentes / Nerd Fonts (cuadritos En Neovim / iconos)

```sh
mkdir -p ~/.local/share/fonts
# Copia aquí los .ttf de la Nerd Font (ej: JetBrainsMono Nerd Font, FiraCode Nerd Font, etc.)
fc-cache -fv
```

Para Xterm, define la fuente en `~/.Xresources`:

```txt
XTerm*faceName: JetBrainsMono Nerd Font
XTerm*faceSize: 12
```

Aplicar:

```sh
xrdb -merge ~/.Xresources
```

## 12) Git Credenciales (gnome-keyring + libsecret)

Configurar helper:

```sh
git config --global credential.helper /usr/lib/git-core/git-credential-libsecret
```

Si ese path no existe, localiza el binario:

```sh
dpkg -L libsecret-1-0 | grep git-credential
dpkg -L git | grep credential
```
#### pd:
La neta soy relativamente nuevo en linux, seguramente hay errores en la documentación y configuraciones redundantes.

