Return-Path: <kurt.r.taylor@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::235; helo=mail-oi1-x235.google.com;
 envelope-from=kurt.r.taylor@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="O7axNQ5X"; 
 dkim-atps=neutral
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com
 [IPv6:2607:f8b0:4864:20::235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43YMfp0c3VzDqHg
 for <openbmc@lists.ozlabs.org>; Tue,  8 Jan 2019 04:23:13 +1100 (AEDT)
Received: by mail-oi1-x235.google.com with SMTP id j21so946987oii.8
 for <openbmc@lists.ozlabs.org>; Mon, 07 Jan 2019 09:23:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:subject:to:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=hEtw0LyxTkR5WK/pje50Y4jXB/wwc/B/Df0VOGnW7+Q=;
 b=O7axNQ5XUgXmyB70CxNqngl6xErAZHYHgI9HRujvkETsNeMy3T4SnClmFI5lID8P5G
 +wSCthqGtgAJ7SCVSXrixwER2HdTYcujO+Vdm+2yrvBgWTKQNhO5lpYkjZjVGhuIvWL9
 N6Y8GkaoIF0+e7F8sfnyn0x49I6ioyVnux0CLFFoZQuybx1hcZuld8DejP3cZ/odu1C4
 uSshWAeChhFvwwyrwBBc2wNNDXx2+eGRHguOc+sAQUrtm5YT4S7bL7MjXiB7zMjecuPn
 aUx4Z9k9w/zL7ns11tKaAfCHoIKsisoMqwy6RHdbPLABYohrhtcNjjcBpEjwRAuwIgEH
 1e1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:subject:to:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=hEtw0LyxTkR5WK/pje50Y4jXB/wwc/B/Df0VOGnW7+Q=;
 b=Nl2zVM8nuD1BMk+gsZm/krN89khuJuCf++IIulMdmpZjiHMy0CR7QJ5vA1TQXbTflV
 y76NTX9nx1D51uQUlV/g5HKT421Z0x5wbnScDN53lo4Qrk+hmusA4hvSq/WTukl+qED2
 8vtmHIMVZo545l3BvzGzqkpR28G9FE7jRnFgS1hVfoXu+CUd3EjrHtwWYgDd54EbTuhC
 he573VtZk3yKRITGB1MIRrssy721vkyq/haSbLxYcpJYg1x3X6qBD2jiCK5SF0ohWgG1
 yotBwFeZEJueVzOQ1AFguZEn3W2zuu9+7sCJovOalpeiIVrZznkPoOecvlDthddJEX7P
 TUlw==
X-Gm-Message-State: AJcUuket6Jn2gLr18Ad7EmOmZ5zD1HEXUwZu5SbN/ddFD8ExqpdH/EHg
 Pmvg+xq5jtpD2tJo7IeuN0Ed39IB
X-Google-Smtp-Source: ALg8bN5AsO0qavNXipAgXE8DZ6aXKUlmhQvRwLTzmEaSE9DyP/cSWZO9SES4MjHxdjww8FwRM95zDg==
X-Received: by 2002:aca:c186:: with SMTP id r128mr8983534oif.52.1546881790867; 
 Mon, 07 Jan 2019 09:23:10 -0800 (PST)
Received: from krtaylors-MacBook-Pro.local (072-182-100-019.res.spectrum.com.
 [72.182.100.19])
 by smtp.gmail.com with ESMTPSA id c78sm48351527oig.30.2019.01.07.09.23.09
 for <openbmc@lists.ozlabs.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 07 Jan 2019 09:23:10 -0800 (PST)
From: krtaylor <kurt.r.taylor@gmail.com>
Subject: OpenBMC 2.6 Release: reviews needed
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Message-ID: <7a8dcee1-52a1-abaf-d0b4-d3a66e4ba128@gmail.com>
Date: Mon, 7 Jan 2019 11:23:09 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.4.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
X-List-Received-Date: Mon, 07 Jan 2019 17:23:15 -0000

Freeze update

The release is close, we are preparing for a release candidate tag. In 
today's community call we agreed to wait to get yocto 2.6 finished up.

PLEASE help and review the following:
https://gerrit.openbmc-project.xyz/#/q/topic:yocto26+status:open

We need to get these merged in the next day or two so that we can tag 
and start the 3-day sanity test before the branch.

See the email "Heads up: 2.6 release freeze" on January 2nd for more 
details on the release process.

Thanks everyone!
Kurt Taylor (krtaylor)
