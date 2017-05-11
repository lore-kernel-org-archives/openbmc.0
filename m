Return-Path: <joel.stan@gmail.com>
Received: from mail-yb0-x233.google.com (mail-yb0-x233.google.com
 [IPv6:2607:f8b0:4002:c09::233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wNsKX0bG4zDqPb
 for <openbmc@lists.ozlabs.org>; Thu, 11 May 2017 22:06:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="vfmsF+na"; 
 dkim-atps=neutral
Received: by mail-yb0-x233.google.com with SMTP id 8so5828758ybw.1
 for <openbmc@lists.ozlabs.org>; Thu, 11 May 2017 05:06:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=ilfpatgE5d16OmlgUCwgoxCoOo781N0FuCU5FznYaqU=;
 b=vfmsF+na5yg4WzApRS7lY/CP1zTEBDenVN03EjSU++F1Gu3iXhnMFrmLukL9K8IP1H
 OfFzOSeS3HiF7Ffk3yXjAIT0CzGuga532PmS6UYfmEvmcBEAjIjs9pDgTSyUY/wOctrb
 LsZf9x2UgwIk+6u34BU4BMvsFIzVcW1QUNLYsYNG2TDX/eonJp5QGKTHR1DudgCUhiFS
 jml7PxX+03aUu/HwXfaEI5oMJS5QxdZE03XPbMD6H21VXaJE6eQx4msLMOQiqIW/AS/h
 kQ9nqhrKXLFHLI/GYSP4VSQPiJJYhAeQPhIFsRW2rrjB+UAIyvduZwuN0DuYtyKN4VXh
 U92Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=ilfpatgE5d16OmlgUCwgoxCoOo781N0FuCU5FznYaqU=;
 b=k7OfYYhHYqQYFnVjQ3+k85IEj+tmcA9r9E+xYaK7HINU/81teVyH0LyYi5kpnOTvSE
 62QaQNDzmP+9YBQDMUjl9sfHZxU9WvlfHrRS0CvJoSW4saU2b+IPX5GID/crEkN3psHG
 1nnbilH1K2GJ61nqkSKOUwuG8ZMTm2IexlUK54KouWqlXnGPS5WmMUhzDDKPn+ryz7nh
 rDUlW6EJc1ox0V3x5UPeA3C5RknUyAMbtPaqQI3bTDFdKNhj83rDEayyuS5/iRC1HPkX
 NhZV28I2PgllCXLqagITLuJOMSyOvrZSV7PaO97Ekpv+XHi9x+hDnx5F2LvdlVedB5O5
 ZNIw==
X-Gm-Message-State: AODbwcBKeujj6kb6P/Bt+Y6QURMezmJKqZh8hJS45vNvG7GUEX/axFLy
 NXJVSx7WuKAKHWS4UtXmy+G+n+jbXLssZS8=
X-Received: by 10.37.108.212 with SMTP id h203mr9139140ybc.77.1494504413855;
 Thu, 11 May 2017 05:06:53 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.171.70 with HTTP; Thu, 11 May 2017 05:06:33 -0700 (PDT)
In-Reply-To: <20170509213902.37939-6-cbostic@linux.vnet.ibm.com>
References: <20170509213902.37939-1-cbostic@linux.vnet.ibm.com>
 <20170509213902.37939-6-cbostic@linux.vnet.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 11 May 2017 21:36:33 +0930
X-Google-Sender-Auth: AbRw40RAoWR0QvWpmMmgfeQI28Y
Message-ID: <CACPK8XeK5RRS+vu5w93R40MspZMjBc=bjD=0ibmLqPdHD3+Yew@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10 5/7] drivers/fsi: Unscan on master
 unregister
To: Christopher Bostic <cbostic@linux.vnet.ibm.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset=UTF-8
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
X-List-Received-Date: Thu, 11 May 2017 12:06:56 -0000

On Wed, May 10, 2017 at 7:09 AM, Christopher Bostic
<cbostic@linux.vnet.ibm.com> wrote:
> Unscan all devices whatn a master unregisters - ensures full
> cleanup.
>
> Signed-off-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>

Applied to dev-4.10.

Cheers,

Joel
