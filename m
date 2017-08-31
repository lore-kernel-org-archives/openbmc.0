Return-Path: <f.fainelli@gmail.com>
Received: from mail-oi0-x243.google.com (mail-oi0-x243.google.com
 [IPv6:2607:f8b0:4003:c06::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xjTD43WsFzDq5b
 for <openbmc@lists.ozlabs.org>; Thu, 31 Aug 2017 14:00:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="fTSxr493"; 
 dkim-atps=neutral
Received: by mail-oi0-x243.google.com with SMTP id r203so7202807oih.5
 for <openbmc@lists.ozlabs.org>; Wed, 30 Aug 2017 21:00:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:user-agent:in-reply-to:references:mime-version
 :content-transfer-encoding:subject:to:cc:from:message-id;
 bh=uaxoGPM+1BmnC9oJLP/82CLGBze5aO0tiLEphLVN4xE=;
 b=fTSxr493wzaR2jSfl+lnCpwsmkUsfScm//HrVl9rmQyZWeTbdvvOAk84g2wkpe1jyH
 DfSeKuKajJg2WmGc0npQLkkgNU2FuYnkVc6OlYYP5qwee7Boqt9ON+XHwSR/YftAIm7Z
 p0BJ3xXpmHg1B2txvl4XDbf8BX7JqUekm8z8Qv32f3J3FUQFbriV/vovCEILIZk+A0Cp
 cfDm7CojZzz2KD33E+iaTy2Mau7jGIKPb69J51TPHUH/AAcbtz21PpxVQFUMZ/08FoyS
 /o8aUqc3jYR95TlfEhtUNuYiTNW+d33+TNQO7brpi4msrWYsmuyB6N+ybFWinHhdT6yr
 qMjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:user-agent:in-reply-to:references
 :mime-version:content-transfer-encoding:subject:to:cc:from
 :message-id;
 bh=uaxoGPM+1BmnC9oJLP/82CLGBze5aO0tiLEphLVN4xE=;
 b=AdHKXZvJYF5IVZQjZBhDQh7G4Fwi0SsS59HiZIte5h4U6OKihvuSRkkbH2eY7ZetwS
 33qJfDCnQ9cmo7BlmZDx+1cxUWO9F+lNwq545xxEP+nvSE0leGHDxANzHI+UwFNrX8ON
 3HivGnUXPKGJAr0X0hQVhq71KZLWCprcD9PlPjHAtN3+nCB4kfZp6d7B7xECZwDQFwVR
 me37kBQSnQ6713TtXlEU4HrZT5CEIZzEa3D0a+ZtsKIeHqH2CPP6YjmVAFIbpQwhQqvc
 OiihohY3OKj0SxCTZlIDED3dDdFhk4ALtEd4tJJBtVNVuw/NiZf1OcJ2EULyDcCC92KN
 M5PQ==
X-Gm-Message-State: AHYfb5h0fhUv7QmnEAK2PvdhvvihvsWbkf1HkG6AWw/k5YWU73nRCndj
 SYK6RYWH5EWqzQ==
X-Received: by 10.202.4.6 with SMTP id 6mr3425822oie.114.1504152000245;
 Wed, 30 Aug 2017 21:00:00 -0700 (PDT)
Received: from ?IPv6:2001:470:d:73f:10ca:f176:623b:9249?
 ([2001:470:d:73f:10ca:f176:623b:9249])
 by smtp.gmail.com with ESMTPSA id m3sm7833903oif.17.2017.08.30.20.59.58
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 30 Aug 2017 20:59:59 -0700 (PDT)
Date: Wed, 30 Aug 2017 20:59:55 -0700
User-Agent: K-9 Mail for Android
In-Reply-To: <20170831033846.23538-1-sam@mendozajonas.com>
References: <20170831033846.23538-1-sam@mendozajonas.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH net-next] net/ncsi: Define {add,
 kill}_vid callbacks for !CONFIG_NET_NCSI
To: Samuel Mendoza-Jonas <sam@mendozajonas.com>,
 "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, OpenBMC Maillist <openbmc@lists.ozlabs.org>
CC: Joel Stanley <joel@jms.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Gavin Shan <gwshan@linux.vnet.ibm.com>
From: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <6D0042A3-C029-4CAC-86B1-F570E541D8C0@gmail.com>
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
X-List-Received-Date: Thu, 31 Aug 2017 04:00:05 -0000

On August 30, 2017 8:38:46 PM PDT, Samuel Mendoza-Jonas <sam@mendozajonas=
=2Ecom> wrote:
>Patch "net/ncsi: Configure VLAN tag filter" defined two new callback
>functions in include/net/ncsi=2Eh, but neglected the !CONFIG_NET_NCSI
>case=2E This can cause a build error if these are referenced elsewhere
>without NCSI enabled, for example in ftgmac100:
>
>>>> ERROR: "ncsi_vlan_rx_kill_vid"
>[drivers/net/ethernet/faraday/ftgmac100=2Eko] undefined!
>>>> ERROR: "ncsi_vlan_rx_add_vid"
>[drivers/net/ethernet/faraday/ftgmac100=2Eko] undefined!
>
>Add definitions for !CONFIG_NET_NCSI to bring it into line with the
>rest
>of ncsi=2Eh
>
>Signed-off-by: Samuel Mendoza-Jonas <sam@mendozajonas=2Ecom>
>---
> include/net/ncsi=2Eh | 8 ++++++++
> 1 file changed, 8 insertions(+)
>
>diff --git a/include/net/ncsi=2Eh b/include/net/ncsi=2Eh
>index 1f96af46df49=2E=2E2b13b6b91a4d 100644
>--- a/include/net/ncsi=2Eh
>+++ b/include/net/ncsi=2Eh
>@@ -36,6 +36,14 @@ int ncsi_start_dev(struct ncsi_dev *nd);
> void ncsi_stop_dev(struct ncsi_dev *nd);
> void ncsi_unregister_dev(struct ncsi_dev *nd);
> #else /* !CONFIG_NET_NCSI */
>+int ncsi_vlan_rx_add_vid(struct net_device *dev, __be16 proto, u16
>vid)
>+{
>+	return -ENOTTY;

Returning -EOPNOTSUPP would probably be more correct here=2E

>+}
>+int ncsi_vlan_rx_kill_vid(struct net_device *dev, __be16 proto, u16
>vid)
>+{
>+	return -ENOTTY;

Likewise=2E

>+}
>static inline struct ncsi_dev *ncsi_register_dev(struct net_device
>*dev,
> 					void (*notifier)(struct ncsi_dev *nd))
> {


--=20
Florian
