from os.path import exists

from i3pystatus import Status

# colors
default='#EDEDED'
green='#32CD32'
yellow='#FFD700'
red='#EE0000'

status = Status(standalone=True)

status.register('clock',
        format='%a, %-d. %b %H:%M',
        color=default,
        )

status.register('mem',
        format='M {percent_used_mem:3.0f}%',
        color=default,
        )

status.register('cpu_usage',
        format='C {usage:3.0f}%',
        hints= {'color': default},
        )

if exists('/sys/class/thermal/thermal_zone0/temp'):
    status.register('temp',
            format='{temp:3.0f}°C',
            color=default,
            alert_color=red,
            )

status.register('load',
        color=default,
        critical_color=yellow,
        )

status.register('battery',
    format='B{status} {percentage:3.0f}% {remaining:%E%H:%M}',
    alert=True,
    alert_percentage=5,
    status={
        'DIS': '↓',
        'CHR': '↑',
        'FULL': '',
    },
    color=default,
    full_color=default,
    charging_color=default,
    critical_color=red,
    not_present_text='',
    )

status.register('network',
        interface='eth0',
        format_up='{v4}',
        format_down='{interface}',
        dynamic_color=False,
        color_up=green,
        color_down=red,
        )

status.register('network',
        interface='wlan0',
        format_up='{essid} {quality:3}%',
        format_down='{interface}',
        dynamic_color=False,
        color_up=green,
        color_down=red,
        )

status.register('openvpn',
        format='{label}',
        vpn_name='*',
        label='vpn',
        colour_up=green,
        colour_down=red,
        )

status.register('pulseaudio',
        format='♪: {volume:3d}',
        color_unmuted=default,
        color_muted=yellow,
        )

status.register('now_playing',
        format='{status} {artist} - {title}',
        color=default,
        status={
            'stop':'◾',
            'play': '▶',
            'pause': '‖',
        },
        )


status.run()
