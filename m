Return-Path: <leetroy@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::233; helo=mail-oi1-x233.google.com;
 envelope-from=leetroy@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="TcinkjRp"; 
 dkim-atps=neutral
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com
 [IPv6:2607:f8b0:4864:20::233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44fJtZ5LHzzDqGq
 for <openbmc@lists.ozlabs.org>; Wed, 10 Apr 2019 19:35:47 +1000 (AEST)
Received: by mail-oi1-x233.google.com with SMTP id l203so1192555oia.3
 for <openbmc@lists.ozlabs.org>; Wed, 10 Apr 2019 02:35:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=kBDO4LijsnGejM1riLSFm9ILJvBlfo37ukmB3rPd3VM=;
 b=TcinkjRpmhnbkoRXZv9gzEih9u/CsqjkgqAxEgFkjA6TWwRNwvnPg4+JbP8OfW0or6
 lpqBDDunpSVC4Zv2ZcONmO+mVamlKnrbkY5TKOJACiAk8OlsTHlvIiKbNrJPWEd/J2fp
 0OWlXFaqwB4LTHuBgPVAmWS4BiaaDO48TJEN1WrjkFqvZKKVmrgam030RyNbBgIvPkId
 8+baD4mhq8sx3uGcJKpiPvoM9h55W1uTXHEfHOlT+bgYrRRoXYn0b2l0pH1x+HUS8T3L
 Sbc7zb5s+Twsgb6+4cjIF1lPp70Mv5Vk/1UwubkBhi6hQJ2qy0PQoamONlPZhBWD5G12
 wZtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=kBDO4LijsnGejM1riLSFm9ILJvBlfo37ukmB3rPd3VM=;
 b=jji2GIj1Y0mTrPi0wRGvNbW4D/ML8gXcowCa/5vgv4WjHcCln01qZGImkzy76ujD8p
 IvJlX4A4b0WJ6c8iHEsEKrQu6lwBedzkvvxQwzSdIxTKb+FeOx5wK6pfj0Rdt97kxBiV
 yuqr/C2rmVEW4qHlz+PA2Pc4jE29VdQqj0LUmLsxCHz3iMc6OXHtsF3Z1ge/mfbXSrgJ
 eCE4WHQb21zF7DupH0sxykVBXw8moKNYrTe8EA1r+1Ikik1aQVtV6r3be3OIuMmSwbt4
 TlnSTNp4PkFwHO+OQzOYEAyF7w0NhQ5his2r37KgroERJI8sO58DlfU5s7qHP3rRa9QY
 z21w==
X-Gm-Message-State: APjAAAVdjNTuXUT1/erKWaABad+k41s7rbrWoVZo7Oc/I+79Y5Igr8Q3
 jrWPKfPUF0nn2TB2Jj+VS6/vwRmMkFXZ/MKn32XyfGqLXv0=
X-Google-Smtp-Source: APXvYqx4FhOD1k92aSBJq3BR6AiU1feYy1GD5ybxoIfCUlaWQCAzB/MMHio3CftPRjxR93rHgbjr2o//oFVfK7oFQ6w=
X-Received: by 2002:aca:ef83:: with SMTP id n125mr1920415oih.80.1554888944253; 
 Wed, 10 Apr 2019 02:35:44 -0700 (PDT)
MIME-Version: 1.0
From: Troy Lee <leetroy@gmail.com>
Date: Wed, 10 Apr 2019 17:35:33 +0800
Message-ID: <CAN9Jwz1y3q3msG28uck2_0oyqNwmACbixHCRiF-hbshZ7ZLTJg@mail.gmail.com>
Subject: Switching to static network address issues
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Wed, 10 Apr 2019 09:35:51 -0000

Hi there,

We met an issue about switching network address from DHCP to static issue.
If we manually set the new static IP address which is the same as
DHCP, the network setting will be dropped.
This issue could be reproduced on qemu with romulus-bmc daily build image.

root@romulus:~# cat /etc/systemd/network/00-bmc-eth0.network
[Match]
Name=eth0
[Network]
LinkLocalAddressing=yes
IPv6AcceptRA=false
DHCP=false
Gateway=10.1.1.1
[DHCP]
ClientIdentifier=mac
UseDNS=true
UseNTP=true
UseHostname=true
SendHostname=true

Thanks,
Vertiv Avocent
Troy Lee
--
Yu-Ting Lee (Troy Lee) <LeeTroy@gmail.com>
