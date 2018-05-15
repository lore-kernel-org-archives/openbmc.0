Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:400c:c05::243; helo=mail-vk0-x243.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="GOkNkuVG"; 
 dkim-atps=neutral
Received: from mail-vk0-x243.google.com (mail-vk0-x243.google.com
 [IPv6:2607:f8b0:400c:c05::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40lfyq50mVzF28N
 for <openbmc@lists.ozlabs.org>; Wed, 16 May 2018 00:26:56 +1000 (AEST)
Received: by mail-vk0-x243.google.com with SMTP id m144-v6so229158vke.4
 for <openbmc@lists.ozlabs.org>; Tue, 15 May 2018 07:26:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=P12rmRasR5YaFhPkBQsn+xqqT/7ycsR9AwhLVfIkN+8=;
 b=GOkNkuVGd/DKEQldbUDRvww00LWLkeEIZzp8agGZGZ2SAAw/fDOD72zpt2tUZSfVoC
 x3Rl+lSxi1KYzupNEsLMKqmr1uOYhy/SqDJqFjiubmlNtvv1wMp9EDGzlEh8Z5eSMXAA
 HG5xHnfmRG1qyxdqdLT32r16Styi0UmUEbsGSfX8hhVq7dRaxt/SLKWVQIrPZ4L9eIV3
 tmEi+YPuKAmXzHVJW/nzL+G/7FfW+vss62Gyzy9wEBTPeNk9G8Hx/aiVRE1axT63x5Kd
 VZoeQINWOefbMQWPO1NcacAmwaTH75cVgcREkqCJ+SOkmCezYAO1xhpo/ur2szOw6d3U
 Uf3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=P12rmRasR5YaFhPkBQsn+xqqT/7ycsR9AwhLVfIkN+8=;
 b=gS+sIkeD5p03PJxcXScG61oTkSoE6NErZqzKH58TcSQDvi/6sSkPAAmajlI/xJmqsE
 yeuAQBGyduo3KFruHJLMEEVPuVwfXGr/fpj+bKeAm5Pnt0n1fBtYqjUKIjCGnn09L2JC
 W/Ft/gDJNhi4GxLD5KwRfd3mSQ4oTNneKSb/ULaoGEF97cW2T119O/SjHpSri5IY42d3
 ZFZwvTvxr4Mwh+sgW422AtTliqV4jQA3YqYcmRflEwNJaHuBm2SHAMYaECg4NZTFH//f
 BIH642fTrt52EtgOBw9E1UadZcQKzP3TxUnsarQsirIT3Bmy/kJhj13tlAW+syr9GQZf
 Lfaw==
X-Gm-Message-State: ALKqPwfwymWc92xCAGL2ols4U68AkRbJ1kPVjZa1a4fAi3IozjS9cqFi
 prQSQ20PtAWS6wm+S1eOaf0FZKDF46TI1PJYFdg9Dl/k
X-Google-Smtp-Source: AB8JxZqpEAJMGvInk0/rduYaKgLYkyDecISR9QqLw+Cu6eBmPAp67SODdpZMgkZxrKdM0h07M/H68CViOpnMFZLfoBs=
X-Received: by 2002:a1f:5cca:: with SMTP id
 q193-v6mr948978vkb.45.1526394413652; 
 Tue, 15 May 2018 07:26:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.87.198 with HTTP; Tue, 15 May 2018 07:26:33 -0700 (PDT)
From: Patrick Venture <venture@google.com>
Date: Tue, 15 May 2018 07:26:33 -0700
Message-ID: <CAO=notzi+BtDV=m5TYPE7UrtO-TYPVLe+LYhUcApX4UgvwfVyA@mail.gmail.com>
Subject: quanta q71l not booting with 4.13
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
X-List-Received-Date: Tue, 15 May 2018 14:27:01 -0000

Hi;

So, i have a couple theories to test but before I ran them down I
figured I'd just ask here.  The quanta-q71l won't boot if the BMC is
running the 4.13 kernel from openbmc.  I'm theorizing that the spi mux
is flipped somehow (maybe a default pin value is getting flipped) or
something else is preventing the host from reading its flash.

Has anyone experienced anything like this on their platform?

Patrick
