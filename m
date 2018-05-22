Return-Path: <liyiadam@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400e:c05::236; helo=mail-pg0-x236.google.com;
 envelope-from=liyiadam@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="gtv1+BKw"; 
 dkim-atps=neutral
Received: from mail-pg0-x236.google.com (mail-pg0-x236.google.com
 [IPv6:2607:f8b0:400e:c05::236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40qf2C44QkzDq7c
 for <openbmc@lists.ozlabs.org>; Tue, 22 May 2018 11:58:39 +1000 (AEST)
Received: by mail-pg0-x236.google.com with SMTP id c22-v6so6466129pgn.11
 for <openbmc@lists.ozlabs.org>; Mon, 21 May 2018 18:58:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=J/GulkbCBiKpqOdVlrsFLPonK3kWz/ADb1EuVIPTizs=;
 b=gtv1+BKweeUbUyt8Udj15tNSBG8g5aozT64S+XriXoBz+OWQqdaxJK/osEw/X/vYCQ
 4Cc3H7IEXPzpZjUMh8kZi9tRUZ1GNLSlMY1qwetCEjhbxueRvFP4crTjdA/EMR+rIUPe
 aArOcwBkM9u/KhHnFfHekeFUYOddbCYwEiITk1ZcrISGkkqTx4ideb6mKHM2zVDq+8O6
 MTSGowmDyR8BgoaNedMs9FoLL1o3wPR7AWl/LlypVlu5Ou8FGICVpigtpCGInNX6vtEr
 nENozXVEB7oq8aF3PD53WtymeGNAzlxOomooWr5S3+YdU1i21m8jYfoYCdA4SngZC8SQ
 HAiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=J/GulkbCBiKpqOdVlrsFLPonK3kWz/ADb1EuVIPTizs=;
 b=KBuahI8H2If0pggjKwnloYm1+u0J87YL/vJm9+PlCcMNAo+PKHFLy2HlPNVPoy+imH
 fR4N4qoGE89xoYf0Yr1L4yhhxirhLY8G+Wc7omJ71FRGPSkQDVKl6GZp2vmUvDKtaMtV
 lav+C6rPjX8K1JuLK84J2Kx+rXHsjUMXoYRqnst1jVPtjDTXHquU/HGvKnkh2tBhjYWn
 Rx5lj+9dvWKgQc9fdkOSMGHxF+NaXp8V2N9H8HWI8w5BsJ4s4q6CyXjySulK5C8uMGRv
 ecWjaHPhXXOqc01j/deKbzA4UtonOSGBURnV4HmRY1zvahmEitJkv1EkabLvRgApoKLq
 IDWw==
X-Gm-Message-State: ALKqPwc7i75dmXhvuLumlz2raiy146Hg+1ks1t2HB/DwDFDJC/3IMCGC
 3oxzQJHfGl6NRu52q2ezhgg=
X-Google-Smtp-Source: AB8JxZoAzXf/4CVfIlfj0szxtkdaB0gcuqD7QcMdY1yP0enjyE7gLAWwgZqh7lhMFuW+m3i3IA0bIQ==
X-Received: by 2002:a62:6c3:: with SMTP id
 186-v6mr21996681pfg.151.1526954317019; 
 Mon, 21 May 2018 18:58:37 -0700 (PDT)
Received: from adams-mbp.cn.ibm.com ([204.110.13.89])
 by smtp.gmail.com with ESMTPSA id u68-v6sm26657464pfu.32.2018.05.21.18.58.33
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 21 May 2018 18:58:36 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 11.2 \(3445.5.20\))
Subject: Re: [RFC] AST2500 video engine driver design
From: Yi Li <liyiadam@gmail.com>
In-Reply-To: <ff0a9c9c-2b09-00e5-3f04-4406b16309e3@linux.vnet.ibm.com>
Date: Tue, 22 May 2018 09:58:23 +0800
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <D092E346-94F2-4827-AC22-0BE3CF8C991D@gmail.com>
References: <ff0a9c9c-2b09-00e5-3f04-4406b16309e3@linux.vnet.ibm.com>
To: Eddie James <eajames@linux.vnet.ibm.com>
X-Mailer: Apple Mail (2.3445.5.20)
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
X-List-Received-Date: Tue, 22 May 2018 01:58:44 -0000



> On 18 May 2018, at 11:42 PM, Eddie James <eajames@linux.vnet.ibm.com> =
wrote:
>=20
> Hi,
>=20
> I'm working on a driver for the AST2500 video engine; just wanted to =
post up the plan in case anyone has any ideas. The purpose behind this =
development is to be able to use IKVM with video from the host and i/o =
from a remote user.
>=20
> The video engine is a piece of hardware in the AST24/2500 that =
captures and/or compresses video data. Typically the input is the host =
graphics, writing it's RGB output to the VGA memory on the BMC. The =
video engine will capture and compress the data and store it in memory. =
The driver should provide an interface for an application to read that =
compressed video in order to get it on the network.
>=20
> The driver interface will use the Video4Linux2 API. This involves =
standard file operations like open, read, and close, as well as a video =
ioctl interface for configuring the device. Configuration options will =
probably be limited, as I think there will only be one mode that will =
provide enough performance for IKVM. I do want to be able to configure =
the video source; either direct from host at the BMC VGA memory or from =
the BMC DRM driver.
>=20
> The most substantial part of the driver will just be the hardware =
setup and manipulation. Intel has done some work here already (thanks =
Ed) which has been useful for configuring the hardware and doing the =
capture/compress loop. I'll be following what I think is fairly common =
for video drivers and only initializing the engine once a file =
descriptor is opened, and then allow more file descriptors to be opened =
as necessary without further touching the engine, though changing =
configs will obviously do the necessary engine operations. Once the last =
file descriptor is released, the engine and clocks will be shut down. =
The read operation will trigger a single frame capture/compress for now.
>=20
> I still have details to hash out regarding streaming, user-space =
buffers, etc, which will probably be necessary to get the performance we =
need.
>=20
> Any comments/questions/concerns?
>=20

There is a requirement from data center customer for BMC, to capture the =
=E2=80=9Clast screen (or snapshot)=E2=80=9D of host system when hosts =
shutdown, reset or crash. Hope there is interface for this feature in =
your design.

Thanks,
-Yi=
