Return-Path: <cyrilbur@gmail.com>
Received: from mail-pg0-x241.google.com (mail-pg0-x241.google.com
 [IPv6:2607:f8b0:400e:c05::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tdcVr5420zDvM9
 for <openbmc@lists.ozlabs.org>; Wed, 14 Dec 2016 11:13:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="rRI/xHZb"; 
 dkim-atps=neutral
Received: by mail-pg0-x241.google.com with SMTP id 3so352387pgd.0
 for <openbmc@lists.ozlabs.org>; Tue, 13 Dec 2016 16:13:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=message-id:subject:from:to:date:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=SJfElYXMNcNH87VD90y1s81jjTcfhhz4+Un4Wb7sBSw=;
 b=rRI/xHZbnon4w5MQqZ3cguJLmdX/EhktAb6BBjULwaS1ZbtxVExaph4I7AinfBTOQq
 +W4sDa3dKtsuEcG1HfTFP/Vuk1fzwgNmknPdK2pFr51NbeVenbdf0tgME6yYcFxfQY8X
 KuLe9QE+eUcZ3OgEIrG2q36meZssSovh+u6/s5wIOewYT/EB07MrsFODqVTtjk7zVkIq
 dSOw/jocYhdXBFSjU4WFrSrn4Rtf56Y7UxmdJcDI2W75dXJSgHBD+WB9rJtHT+o2CXL9
 Oog5YXcWHj36+kJb8UfK/JtDZgNWmoUTtsSER0z0SA7z+OwuQoFtHm4gDpHqyjcyuHLd
 gHuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SJfElYXMNcNH87VD90y1s81jjTcfhhz4+Un4Wb7sBSw=;
 b=cONrngeF0wKIQVm68WEtT6waKHRWgwbHegLovwQefMHcSS6BYCnBaNAaBI8E6eFyxO
 rYGxIebVsUJtNK4DZX6+s+PNXU1+nBM5vKacme5Y2IP4IStE/Uc8st0Ax+hvXQaQYLiJ
 dqyqFPYRUp2dr56UF8aUB7r0NlazI7pyuD3Y9B0Zwo26mL3aANQ4KmnzVqmnZKCjeJmz
 6ctfNy2j+TT7ZVjpZ6ViQG+YD2q77NGqIGsjfem/T4srRhanLjhvu6b5kPQFv8ch2s2f
 yBMb1Ov6RZeSnqWb7W++1XE2nU9Q9w3NE08cQHO/hDv/XBDN46bTLa+n3QOYz8OUqpzT
 Fjdw==
X-Gm-Message-State: AKaTC03gX8bggm5t5D0/hDG9MHKz9yofCsbsArq5hSJ9h8LfR/eyIKJWv4DG1LKL85OVCw==
X-Received: by 10.98.214.20 with SMTP id r20mr105423847pfg.59.1481674418898;
 Tue, 13 Dec 2016 16:13:38 -0800 (PST)
Received: from cyril.ozlabs.ibm.com ([122.99.82.10])
 by smtp.googlemail.com with ESMTPSA id a11sm82303501pfe.96.2016.12.13.16.13.36
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 13 Dec 2016 16:13:38 -0800 (PST)
Message-ID: <1481674414.668.0.camel@gmail.com>
Subject: Re: [PATCH linux 0/3] LPC/MBOX work
From: Cyril Bur <cyrilbur@gmail.com>
To: =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>, 
 openbmc@lists.ozlabs.org
Date: Wed, 14 Dec 2016 11:13:34 +1100
In-Reply-To: <9ff2c6fd-8d1d-0f71-f475-414b76711246@kaod.org>
References: <20161209054323.7320-1-cyrilbur@gmail.com>
 <9ff2c6fd-8d1d-0f71-f475-414b76711246@kaod.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.22.2 
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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
X-List-Received-Date: Wed, 14 Dec 2016 00:13:41 -0000

On Tue, 2016-12-13 at 11:24 +0100, Cédric Le Goater wrote:
> On 12/09/2016 06:43 AM, Cyril Bur wrote:
> > Cedric (or anyone really): Do you know of a way the lpc-ctrl driver
> > could query the MTD subsystem for the size of the PNOR? There is
> > currently a hack in the UNMAP ioctl() which can't hang around.
> 
> well, it is a platform device so you could loop on them I guess. 
> Or maybe use register_mtd_user() ? 

Oh yes looks like that will work.

Thanks,

Cyril
> 
> C.
