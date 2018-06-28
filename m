Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c09::244; helo=mail-qk0-x244.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="C32q5scu"; 
 dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="WZD6NMIU"; 
 dkim-atps=neutral
Received: from mail-qk0-x244.google.com (mail-qk0-x244.google.com
 [IPv6:2607:f8b0:400d:c09::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41GRGW3xh7zF1Nq;
 Thu, 28 Jun 2018 14:13:23 +1000 (AEST)
Received: by mail-qk0-x244.google.com with SMTP id z74-v6so2276602qkb.10;
 Wed, 27 Jun 2018 21:13:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=7VH7VPCh5cAI5Q6ik/KRRlbpR+d/qk29nNcRybPcwGQ=;
 b=C32q5scupFNf253XL8aGFidnmp6zDbrIqoZVAgfzxg6fgP+IM0zOj07r9LLlbZgBdf
 vJuG2DreB8H6ESX2eeAxzKPn0DJmlCvE93s61LYS1DEWQi2pbnw6cGIRkGidlj8PvnY+
 seG4yfyI+jzfuzi5fm1K7yhPujtJa/vg1BUL5ECZhIZ1npn9D9/ABwVUUhGhZzVyg4V8
 cHi42TXp/dR5USSeFYZCSspsuqD6gV7I/NNT/3/GJL0gSgYT7doh8nIi32+8BZFlW6ZD
 W5U2Ajj3Vay/Ffyadrv820FD1BsTghgHdWI2kBcK7kg0FS0c9znXdphZRhsYYY8JswBs
 OzVg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=7VH7VPCh5cAI5Q6ik/KRRlbpR+d/qk29nNcRybPcwGQ=;
 b=WZD6NMIUAYuYwg7Y8S0trvyZ2LN3PoxYpKUdnBkmyBpiOPict53ZxXsAupoYBkiilh
 WNnw8FBBuhQyhtPmmVhzWmbtiFY32YflAl3HdcT9wX3W66d6Sb5TLOd/u9FUnDxwgUCA
 klmXJEp/fIeape8PHWXq0Ts0W/ycCFSHRTsyY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=7VH7VPCh5cAI5Q6ik/KRRlbpR+d/qk29nNcRybPcwGQ=;
 b=UMnaLzZrZS4NI4o6hKeTKjAlUo9H1HcE/EeRMsFR83vLPmc8s1Zt5sQbJmNitRGtzt
 dTNbWqYa0qbb0sPtC7FlZmxKY/7aAHhW75jUprpdNOqMLltibBnQSBOAAoINK/QM2QEY
 6NfoIghXmgnA0u1pQtcAmhPEUv208hh/QRGn2/BpsmX0GPLuyqym8cXxJDPYBq/aArkB
 iEEfUBUCAtJugoLpX2qP1TdzWJHDRn315HmrLJQ0B/FxaYD26uv3i9QE98eOlds+8zbr
 O2+t8D4ySBECwrMN3Vag9UMMqicps6f7sAaGvxyDNAeWkuHuCgO2/BBuDoVUgluN9ZCI
 9GSg==
X-Gm-Message-State: APt69E0saCMNsezMB+rnZktRbTxJvy4qSkzddvtOX6mCTWiqhBBg2zHK
 HaPCM00Uvt2QQYxfPefbx+IuqqRmClrPVOWcNT8=
X-Google-Smtp-Source: AAOMgpfGkMsXX1KhdHmVQOsOZ6FN4KpmiO2Kk7fzUUBNBZ4N+c9xW3tlsp68ZbVOcObBUYT3sjUx2d9QQjETAbd5UBs=
X-Received: by 2002:a37:6983:: with SMTP id
 e125-v6mr7370231qkc.352.1530159201171; 
 Wed, 27 Jun 2018 21:13:21 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 2002:ac8:169d:0:0:0:0:0 with HTTP; Wed, 27 Jun 2018 21:13:00
 -0700 (PDT)
In-Reply-To: <20180626232605.13420-15-benh@kernel.crashing.org>
References: <20180626232605.13420-1-benh@kernel.crashing.org>
 <20180626232605.13420-15-benh@kernel.crashing.org>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 28 Jun 2018 13:43:00 +0930
X-Google-Sender-Auth: XDrBmHLEJNw2Ctut1Qg3JEBJp4o
Message-ID: <CACPK8XeLs9URZCO1KnoMmZawSwr9URpCBxn=5gKxKZbJT-p3Uw@mail.gmail.com>
Subject: Re: [PATCH 14/14] arm: dts: OpenPower Palmetto system can use
 coprocessor for FSI
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: linux-aspeed@lists.ozlabs.org, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 devicetree <devicetree@vger.kernel.org>, Andrew Jeffery <andrew@aj.id.au>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
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
X-List-Received-Date: Thu, 28 Jun 2018 04:13:24 -0000

On 27 June 2018 at 08:56, Benjamin Herrenschmidt
<benh@kernel.crashing.org> wrote:
> This switches away from userspace bitbanging to kernel FSI
> using the coprocessor.
>
> Signed-off-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>


As with the other patch, I will take this through the ASPEED SoC tree
once we've got acks on the bindings.

Cheers,

Joel
