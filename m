Return-Path: <christopher.lee.bostic@gmail.com>
Received: from mail-wm0-x234.google.com (mail-wm0-x234.google.com
 [IPv6:2a00:1450:400c:c09::234])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tSJrW5TdrzDvxv
 for <openbmc@lists.ozlabs.org>; Tue, 29 Nov 2016 07:56:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="VV17TV3F"; 
 dkim-atps=neutral
Received: by mail-wm0-x234.google.com with SMTP id f82so168270369wmf.1
 for <openbmc@lists.ozlabs.org>; Mon, 28 Nov 2016 12:56:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:from:date:message-id:subject:to;
 bh=21CeBW8qTXAJH8dUJOxQilS/fqfzBfVMr9tyjPeXbbE=;
 b=VV17TV3FVm8NPG3fbWn2XNoIq8RuCECRC7gTtQOShdzBLv7TDdFx5v9aAI7kLuOMRW
 k4Q5swY66jEZv3arfCgSAn02TXV5xzbL3RTcrEl1znqxZrDCzN4pO/kQhUKb8xc52TAH
 IJLJToo6qBuSXd11+6c/mpi/OijAgxvG7/HcfM7ehJ77nJApwBaDDvzUKhVhlNxzSqgb
 BSg9WS+QNG9amZ//BG9OuYsyohKD7aVNzl6WzThcBHCC41u3JlEtBX7P0sNnkBKFtlBM
 JMKWBv5VDkJahg50iHyPre1oan1G+Bol3EMOf7mrpBOa6h4Ysm0eUp6F7ExXHNj1DBR3
 mFUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=21CeBW8qTXAJH8dUJOxQilS/fqfzBfVMr9tyjPeXbbE=;
 b=mWqWSfv+Q9jPxlH2W1Kq2kLPkwugMQxgXF1vX5CnWJ/eZsHB7jk8ej/Xw54BDaZSVV
 b1nqR9C2fB0KMLcrL547SEDwbhfzEfx0PzjEi7Ob4sKYUiUmi2X4jBRrx+sT7FP3Ysgy
 KNjn+qlIw7Mo/BzOaSfYdXTl9nVGIfXq4RyEpjiGqCuKHMk82MpEeAW8F1x9pEgmXZ4m
 QgAxgFbFqi6NsfG3WubIVhndBzIPK5JvZCdA4Fm+XuXyywLo0dAqdMvHCqsU0+ygpjQE
 XRj3VyQoUttXgfWmxw5cX6KbeuInOQMYzd/dblF/Gezuoimw/0su6iZk7TExKKU1oGwF
 yIBQ==
X-Gm-Message-State: AKaTC001//3X7OVklelrWXjsjx43DzEYdes70fLEwgsdhCy0dTPsPvnqTuL80z11V3FztQ7tApXW5OWYNwHUWQ==
X-Received: by 10.28.62.141 with SMTP id l135mr22987889wma.20.1480366600648;
 Mon, 28 Nov 2016 12:56:40 -0800 (PST)
MIME-Version: 1.0
Received: by 10.80.179.207 with HTTP; Mon, 28 Nov 2016 12:56:40 -0800 (PST)
From: Christopher Bostic <christopher.lee.bostic@gmail.com>
Date: Mon, 28 Nov 2016 14:56:40 -0600
Message-ID: <CAA0LjjUbmBkFU2YDpvSK01uBGrLyK_H2Dvt3UdG-LC09uWg_9w@mail.gmail.com>
Subject: Palmetto GPIO pin configuration for Voltage Translator Control
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset=UTF-8
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 28 Nov 2016 20:56:44 -0000

I'm attempting to identify the present owner of the 'Voltage
Translator Control' pin (H6).  This should be owned by the OpenFSI
device driver but the GPIO Linux driver indicates this pin is in use
when OpenFSI attempts to grab it.   Talking with Brad Bishop it
appears that H6 is not defined in
openbmc/skeleton/blob/master/configs/Palmetto.py .   The OpenFSI
driver can successfully grab the other pins it needs which are defined
in this file:  FSI_DATA, FSI_ENABLE, FSI_CLK, CRONUS_SEL.

File excerpt:

GPIO_CONFIG = {} GPIO_CONFIG['FSI_CLK'] = { 'gpio_pin': 'A4',
'direction': 'out' } GPIO_CONFIG['FSI_DATA'] = { 'gpio_pin': 'A5',
'direction': 'out' } GPIO_CONFIG['FSI_ENABLE'] = { 'gpio_pin': 'D0',
'direction': 'out' } GPIO_CONFIG['POWER_PIN'] = { 'gpio_pin': 'E1',
'direction': 'out' } GPIO_CONFIG['CRONUS_SEL'] = { 'gpio_pin': 'A6',
'direction': 'out' }
.
.
.

Can an entry for the voltage translator control pin be added to this
or is there a reason it is not defined in Palmetto.py?   Additionally,
any other code using this pin should be updated to not touch it.

Note that this is not directly related to the GPIO hog updates that
are in process of being added to the palmetto device tree.  This issue
exists without that change.

Any input would be appreciated.

Thanks,
Chris
