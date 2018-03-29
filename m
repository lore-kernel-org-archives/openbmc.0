Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:400c:c05::234; helo=mail-vk0-x234.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="ce60UXln"; 
 dkim-atps=neutral
Received: from mail-vk0-x234.google.com (mail-vk0-x234.google.com
 [IPv6:2607:f8b0:400c:c05::234])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40BS154s4fzDqqH
 for <openbmc@lists.ozlabs.org>; Thu, 29 Mar 2018 12:32:41 +1100 (AEDT)
Received: by mail-vk0-x234.google.com with SMTP id n124so2518478vkd.6
 for <openbmc@lists.ozlabs.org>; Wed, 28 Mar 2018 18:32:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=bu1uP2GysLfIpCby4uXT/RTd7ob3Cq4wTlehsgal3LM=;
 b=ce60UXlnRr6hzA9VN8XAgPCI+63e94+5D/6u4aqMr7wULDBvDdtRrLvG/KtEX+m7He
 J4G9eHvbh/BAWjkvPyuqvXDrH8u57lRte1Qvk1b423OVaraa4z/UvxDm2PqdZeEL3AG7
 rPE5T0NIrSYsS+GkWBa9jim+9et9ncWSQCVVdMXnzrqmchH/ATlWXNnaEK/lFBf3ulfL
 AtsjqiQxEJ5BV3kJJshZ+Fj6Z1tZBVwxAhTFokt2B0zk/s8szR/vB6pF4Iub5dpM3Dq1
 gmqd4pGtbeSpbQ9de1MXwv4kOVzvAMjTgh8+Yx1SPbL3NCDfKReRvhYt5OjvovaHWyii
 gMBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=bu1uP2GysLfIpCby4uXT/RTd7ob3Cq4wTlehsgal3LM=;
 b=KbV2PdtMVBXkTFr0o2ZwckVgSNDKl9ddJJHrbDTyZ/1eUu0hsOMXnkbdIwqzD3eKr5
 mMOOqEqdwEX6ifzVJ5rcIcfOE9JHbBf32zPm2pUAG3rTQjSUs6ZD0Y1ALx1x9VDAFitW
 wLuk7Z8UwihVuDysmaWUmruxtmD6w1mYnqtUis0F+nFTdlc3aAG5HFMgdpSZB10Yihj9
 eETYkc27aPK9RbZBDvgUT5K+pOmFNgWJ2irUSushDozwKetK42E4l5cHPOF10iC5VXCI
 GrRgmcyjvJG1qGw+mp3qSTUqJzRO+H0F6WS4Ufsz4ZO3Jd7uPIU7CoaUZ1oN+3o6qv+N
 0xuw==
X-Gm-Message-State: AElRT7Eeu84OUrTVNLfyxevD6UskYusnDZgiMy0Uh1CZ3NgQryOYGjzl
 YCaOE6eOifrS356FmyHuuCO7A6C97oEmFuCRHZ/nZLzKatA=
X-Google-Smtp-Source: AIpwx4/mTYpSlX9+vPEznDWkbfR320dQE4/sJT/Hk7CmKLlTLVXUUWxS3jTJOEC9wyR2An26+PyYelNC9aRrp0/5r9I=
X-Received: by 10.31.63.16 with SMTP id m16mr3935831vka.73.1522287158193; Wed,
 28 Mar 2018 18:32:38 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.124.193 with HTTP; Wed, 28 Mar 2018 18:32:17 -0700 (PDT)
From: Patrick Venture <venture@google.com>
Date: Wed, 28 Mar 2018 18:32:17 -0700
Message-ID: <CAO=notz-i3A1TyRmffxyeqXTYFc4H4t-eMSW2LG-Gjs7mES94g@mail.gmail.com>
Subject: RFC Post Watchdog Daemon
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 29 Mar 2018 01:32:42 -0000

https://gerrit.openbmc-project.xyz/#/c/9801/1

Take a look if you're interested  -- or bored :D  It's a watchdog
daemon that consumes postcodes from phosphor-host-postd and kicks the
phosphor-watchdog appropriately.  It has the caveat though that you
can configure a different watchdog interval for a specific post code
such that you can drive watchdog behavior from the post codes to
enable custom behavior, such as allowing more time for the kernel to
start after BIOS or whatever you want.  Or if you have a simple port
80h hardware watchdog driver that's out-of-band from IPMI :D

Patrick
