Return-Path: <kurt.r.taylor@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4003:c06::236; helo=mail-oi0-x236.google.com;
 envelope-from=kurt.r.taylor@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="ARRDpAES"; 
 dkim-atps=neutral
Received: from mail-oi0-x236.google.com (mail-oi0-x236.google.com
 [IPv6:2607:f8b0:4003:c06::236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42H0cr590wzF3QS
 for <openbmc@lists.ozlabs.org>; Sat, 22 Sep 2018 03:16:28 +1000 (AEST)
Received: by mail-oi0-x236.google.com with SMTP id l202-v6so12032158oig.7
 for <openbmc@lists.ozlabs.org>; Fri, 21 Sep 2018 10:16:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:subject:to:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=sFNLWO100lG4SclwszRRgSvtIrmOuZsq3TQtsWeOKlA=;
 b=ARRDpAESqVHMqLTS/S+tsqRHVeuni2tik+d6h+ldtl26mrq6DrFaoelzIw2o3Fqebw
 eE8oStq4MMQtFaZyQojPS4ob6dBCX9vbIhgYGe9JZ1yko/V08n3VjDgWNMYkI6Di4XjT
 I79NifbADL81iILKHRt30a3Qe73QJy1hrUD5bUyae6Nk3e22ZzbgrwKw1qW5eqtT2MKQ
 OFhi96cxV2Q2IxyVT5eZjI72Q7vSw2wt6M0AtS5nf9DaylQrJf5LpU50/9oJmtGmTwbo
 V+hqfj+v6OuYaGlTVJbWhug9CwycfZFNraIunVqeD+aYto5v6lgBxkxKZyp5X5o8mPPf
 39kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:subject:to:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=sFNLWO100lG4SclwszRRgSvtIrmOuZsq3TQtsWeOKlA=;
 b=YwzN0kUkBqAXyqW26dEAOlj2f3TOXn1tVVhHL7JZVokVYCyZOKeZa0CIgAinYsSOOd
 xUKsmdDNZGRhW1jDkIVXhoVA3wJa+C7w487iLcfNS6ckWsYI+WormuDd6tbH5zAh2GXa
 pJBa5sVcb4xeMQsaObmO1fBsg2PGK2k6iC3vLKCsRQ72Jv9EAjLke93Nv1qTnOkGOYsc
 Q5AVCCnfJ7wbn0ew9CnhRcPhjznGtwLD7TfwlYlkN5cR0tbGtFaUfSFjYpurcx2dWITH
 6QTw/WEaE+z7T+jmof3mVX57UehRNVsW1IiMwqks5VB6rY6CX0hQh+pqtdbfdAyWscjZ
 vhYg==
X-Gm-Message-State: APzg51B2xOo7ENsQQrNMwxsjQmtNE4U88mVuJaL79FEIPEu393kGRMxr
 GBX1lVXpj6oI4bUom8asxwVY4O1h
X-Google-Smtp-Source: ANB0VdbwMFg+BSMEUNr9ZnjgPrJlgHtwu/bcSV1JhtTR2BDXccs24RxY4WqbqgKxBLtO5vHHv5/2Qg==
X-Received: by 2002:aca:b641:: with SMTP id
 g62-v6mr2275408oif.71.1537550185513; 
 Fri, 21 Sep 2018 10:16:25 -0700 (PDT)
Received: from krtaylors-MacBook-Pro.local (072-182-100-019.res.spectrum.com.
 [72.182.100.19])
 by smtp.gmail.com with ESMTPSA id a3-v6sm5016469otd.17.2018.09.21.10.16.24
 for <openbmc@lists.ozlabs.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 21 Sep 2018 10:16:25 -0700 (PDT)
From: krtaylor <kurt.r.taylor@gmail.com>
Subject: REMINDER: OpenBMC Fix-It vSprint - Sept 24-25
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Message-ID: <14fd1d12-1fbf-f582-422a-f63e73afa0a7@gmail.com>
Date: Fri, 21 Sep 2018 12:16:24 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:52.0)
 Gecko/20100101 Thunderbird/52.9.1
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
X-List-Received-Date: Fri, 21 Sep 2018 17:16:29 -0000

All,

The second vSprint is planned for this coming Monday and Tuesday - 
*everyone* is invited to participate as much or as little as you can.

WHEN:
Monday Sept 24th 1:00am UTC - Wednesday Sept 26th 1:00am UTC
(Sunday 8:00pm Central - Tuesday 8:00pm Central)

WHERE:
Freenode IRC #openbmc-meeting

WORK ITEMS:
https://docs.google.com/spreadsheets/d/1j4cpTGcUPUZzW4WT1vI0iFVVJApSBbVEvrZJInhI30U/edit?usp=sharing

Feel free to add work items to the spreadsheet, but try to keep them 
reasonable in size so that they can be finished (or almost) in a 2 day 
period.

Jump in IRC and tell everyone what you are doing. And, don't leave the 
channel even though you go do something else. The more you communicate 
in IRC, the more successful the vSprint will be.

When other timezones come online, they will be able to read the 
scrollback and catch up with where you are.

Any questions? Find me on IRC!

Kurt Taylor (krtaylor)
