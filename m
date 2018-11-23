Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::542; helo=mail-pg1-x542.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="uZfIr46D"; 
 dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 431gbP2p23zDqWr
 for <openbmc@lists.ozlabs.org>; Sat, 24 Nov 2018 02:44:16 +1100 (AEDT)
Received: by mail-pg1-x542.google.com with SMTP id 80so3233278pge.4
 for <openbmc@lists.ozlabs.org>; Fri, 23 Nov 2018 07:44:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=j8Wq74AEGiK9cqVEd8apCtCuJHJbYaBvIgDyRldh4Fs=;
 b=uZfIr46DDsoJ6Hvl8JrOi1ZbT0r/RF3LRqTG+PxbvbuzF+aZCAIf9C/rnQ5pskPXD9
 AysxQTnDbhnMEKKGKvV0fJ8OhAw+KhlIHpsCyF7skBO8ajetMBpyu6LZLuwE5u1taE26
 FbfQ2HdDYOOIQRe1B3wD5HeRIWa02Dipov3RmbGXRiE55RhxCkwGwtNIymjsF6xvD5JW
 CuQSCgczA8cPadC6JuFAVCxNtNVxAL3iD3KF6lSekHla42eJwFo/mRdpTtUZAIz3Zb69
 GPI/9oYOTFosX0vlLQKNpTMMhM8q2kPz1o2YyfIlvua27rh/Vr8LWQyIHXAceyR7Tpry
 V/AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=j8Wq74AEGiK9cqVEd8apCtCuJHJbYaBvIgDyRldh4Fs=;
 b=mmeXVvAsc6Rduemco/8WwfFuFasZ6TOT4KTL9syMhqilJeR9FyQPr/KnwnMo5ZCOaF
 OSxKRoO3ar3JfKR+fbpJIAbd2wauUAIyhixvoHDHz3+Urj0gRtS4cY/GzPtQ1lj6ejkS
 PQde8fzq03I/EDUugiIN/Oyf05hMTdkRUiXgX3GzLfZYmtSSJQ0ny+InTPQHx01R/K0w
 IJOj/RgREtFHCv8D7AVNOGPxSjIyliyU3ua+TRMdGK5C0XtMiNmJ9K1Vxu+9o2aO3Vji
 KmIoVbzMlOYhykAJlC8pueIuRXgVCAQiQfmrun/T6rf6npfVQXsyD7mvIatSIc+VCFcv
 5BmA==
X-Gm-Message-State: AGRZ1gILwaKGHXEtZy/en6gXyK6BxqS8LTopDDJpkVKejTWrgFjTw0Y8
 vTY16AcB3Y0jM3Ztb/Yh8hoct48W6qsOhVLu73peFw==
X-Google-Smtp-Source: AJdET5e94PAR9+4jUddiGD6YSHJHeWRVk3CQjWzxf9x6m97JR1tz8lWENA5ize+hNJJtBvHV/VXfRrGmRMQ4HrZFAas=
X-Received: by 2002:a62:5d0c:: with SMTP id r12mr16996894pfb.0.1542987854647; 
 Fri, 23 Nov 2018 07:44:14 -0800 (PST)
MIME-Version: 1.0
References: <CAHkHK0-jQe7SnUcmNeNT2i9DyOgbUALKN=RFePWkUXbHSvF9jA@mail.gmail.com>
In-Reply-To: <CAHkHK0-jQe7SnUcmNeNT2i9DyOgbUALKN=RFePWkUXbHSvF9jA@mail.gmail.com>
From: Patrick Venture <venture@google.com>
Date: Fri, 23 Nov 2018 07:44:03 -0800
Message-ID: <CAO=notxGsEwVS-_6ej8rFHNiv4-zOuErp6wzECfFGJYZfcxAHQ@mail.gmail.com>
Subject: Re: phosphor-hwmon failed to start with aspeed fantach sensor
To: wangzhiqiang8906@gmail.com
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 23 Nov 2018 15:44:18 -0000

On Thu, Nov 22, 2018 at 11:11 PM qianlihu <wangzhiqiang8906@gmail.com> wrote:
>
> Hi all,
>
> On my board,when host powed off, the fan would stop.
>
> then,phosphor-hwmon failed to start
>
> debug:
>
> cat /sys/class/hwmon/hwmon0/fan1_input
>         read error Connection timedout.
>
> edit the config file,
>         LABEL_fan1 = fan1
>         REMOVERCS = 110 // 110 means ETIMEDOUT
>
> when host powerd on
>         1. echo add > /sys/class/hwmon/hwmon0/uevent
>         2. phosphor-hwmon started
>         3. host power off
>         4. phosphor-hwmon did not exit.
>         5. cpu usage of hwmon-read would be 4%
>
> when host powerd off
>         1. echo add > /sys/class/hwmon/hwmon0/uevent
>         2. failed to start phosphor-hwmon.
>
> I found when phosphor-hwmon init
>
>    Sensor::addValue would read fan1_input(there is no fan1_fault in sysfs),
>    and it caused read timedout unexpection.
>
>    so init failed.
>
> On my board,I  want to boot the bmc with phosphor-hwmon when host powered off.
>
> what should I do ?

You have a couple options, one will basically remove the sensor from
dbus on read failure, the other just leaves it but sets the value to
-errno (in this case ETIMEDOUT).

There are two configuration option switches for these, you can add it
to your bbappend:

EXTRA_OECONF_append = " --enable-remove-from-dbus-on-fail"

EXTRA_OECONF_append = " --enable-negative-errno-on-fail"

>
>
> Thanks
>
>
>
> --qianlihu
