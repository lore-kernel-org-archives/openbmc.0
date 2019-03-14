Return-Path: <wangzqbj@inspur.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=inspur.com
 (client-ip=162.243.126.186; helo=vip.corpemail.net;
 envelope-from=wangzqbj@inspur.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=inspur.com
Received: from vip.corpemail.net (vip.corpemail.net [162.243.126.186])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44KllR1Rr5zDq5g
 for <openbmc@lists.ozlabs.org>; Thu, 14 Mar 2019 21:47:14 +1100 (AEDT)
Received: from ([60.208.111.195])
 by unicom146.biz-email.net (Antispam) with ASMTP (SSL) id FND94736
 for <openbmc@lists.ozlabs.org>; Thu, 14 Mar 2019 18:41:36 +0800
Received: from mail-lj1-f181.google.com (10.100.1.52) by
 jtjnmail201608.home.langchao.com (10.100.2.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1591.10; Thu, 14 Mar 2019 18:41:13 +0800
Received: by mail-lj1-f181.google.com with SMTP id v3so4343020ljk.9
 for <openbmc@lists.ozlabs.org>; Thu, 14 Mar 2019 03:41:47 -0700 (PDT)
X-Gm-Message-State: APjAAAUi6t/L2XPVeMsBWMJ833wlJeK11rs1RlF9YJmi1rqYvPThinwS
 LMcr1+cuSbtb63Hcy63K0LRSWoKrzDKv3bDQ05M=
X-Google-Smtp-Source: APXvYqwdj5X47LEsOA0D7Nn3bEu/RUD8/JfRGN0Ebp3kr72gpy7GUmdqbFhDzvakGmT5J2/mmNnOmAFF+SnU9dYsdwE=
X-Received: by 2002:a2e:551d:: with SMTP id j29mr23740958ljb.178.1552560099444; 
 Thu, 14 Mar 2019 03:41:39 -0700 (PDT)
MIME-Version: 1.0
From: John Wang <wangzqbj@inspur.com>
Date: Thu, 14 Mar 2019 18:41:28 +0800
X-Gmail-Original-Message-ID: <CAHkHK09KjAKpOGYySXTSB6KsrNOCCYcRVvJYFdt2O8_KPJFMDg@mail.gmail.com>
Message-ID: <CAHkHK09KjAKpOGYySXTSB6KsrNOCCYcRVvJYFdt2O8_KPJFMDg@mail.gmail.com>
Subject: How to use fru-device
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [10.100.1.52]
X-ClientProxiedBy: jtjnmail201608.home.langchao.com (10.100.2.8) To
 jtjnmail201608.home.langchao.com (10.100.2.8)
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
X-List-Received-Date: Thu, 14 Mar 2019 10:47:17 -0000

Hi all

I have now encountered a problem with fru-device (entity-manager).

1 Make the fru.bin file /etc/fru/baseboard.fru.bin for
testing,Everything looks great
2 dd if/etc/fru/baseboard.fru.bin of=/sys/class/i2c-dev/xxxxx/eeprom,
busctrl tree xyz.openbmc_project.FruDevice will appear
/xyz/openbmc_project/FruDevice/____________product_manufacturer_______________________________
Similar path. View the properties through busctl introspect and find
that the property values are also garbled.
3 Delete the eeprom node in the dts file and still have this problem.

Note:  eeprom at24c512 16bit

Does anyone help me to point out where I should pay attention when
debugging, how should I solve this problem?

Best Regards

John
