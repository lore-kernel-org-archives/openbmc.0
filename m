Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::42e; helo=mail-pf1-x42e.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="MTp2VnVn"; 
 dkim-atps=neutral
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com
 [IPv6:2607:f8b0:4864:20::42e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42cngG6plbzF2Pq
 for <openbmc@lists.ozlabs.org>; Sun, 21 Oct 2018 03:05:14 +1100 (AEDT)
Received: by mail-pf1-x42e.google.com with SMTP id f26-v6so17857101pfn.9
 for <openbmc@lists.ozlabs.org>; Sat, 20 Oct 2018 09:05:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=GrEWNagDkoLnLUqz6ELn3BJDDD0zFpebp6eKbeZH5Fw=;
 b=MTp2VnVnO8kR/5kpJxLOw4x+ZtYUqjJ9bTsfsxzoCZt4vHKApRfLuB7WpTT+iJyCZT
 OvtBssGszrcoe+tmeZAqwTc7wAlxgD1xhAxD2U22n2t5obY/bC2kuqmbn353fDCSYCum
 pCFvKR2lXiDpo+8Iz8xJbJUN5eWOzKr5uJnvmupc6CHR3qJtQ8YbwXMm3mh7grBcAe0j
 T+dSpz7ZMSe7f5SZElU1OPZifRCq6fi1CwMorOFJQn6waGmroam4+ZmFnschfsaTx/Gv
 sZ22hE14PU+kyXybTiRy6uSEExz8AMrDFGV8bXrkcM++greXhmWgWN3CqMrraNKbnrlZ
 ES4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=GrEWNagDkoLnLUqz6ELn3BJDDD0zFpebp6eKbeZH5Fw=;
 b=kIqw/YUBLRkg0EEVqQZPeliqNB2QV/3rWK04mGHYUlWgudGh1dw+7OTTr+LAu+4hAy
 hIfrZXk/NHBdi9t9N0dwT7n4hroEt4zRpZVjZWn4axx2sikle3clw0fyXJNCf7f5NbZC
 f2Kx/oViEHyiXb3mcBVB7LSso0DFDWRUAtOOAC1UhF7BKJp0/2KfZuw2o7erp6GnYoky
 73ewj8XT8ajMWN10qRKSriiA+y7qUduqiYNe0JhfNQNXWNMCFPs5gfD9Svn3e4OyDs5Y
 90iXyES38agmgEtzhTITCEM1SGuQ6Fqwibon/3ySqkEsuRuUGWcWP1Bfwy7GX6UmURfN
 3zPQ==
X-Gm-Message-State: ABuFfog23y1EBH63bJQoBEKh2374vh0IvjZn+DesrFxmTc5K/Q2DGZU1
 WxRhMnOKxnYAGkBhMc/0dfQLdNwUeQ2mMkRu2uUp0g==
X-Google-Smtp-Source: ACcGV61FwwRlhollr3cZHh2FI00UlXwjSP3U5cTfaN79VbUefukPu/SL+ij6FnqBgekqU9UQ0pTc0X1ddvol0OeGLhg=
X-Received: by 2002:a63:e601:: with SMTP id
 g1-v6mr37191092pgh.290.1540051511882; 
 Sat, 20 Oct 2018 09:05:11 -0700 (PDT)
MIME-Version: 1.0
References: <2F1B55CF-6A56-4154-A5C1-67F76EBB6184@fb.com>
In-Reply-To: <2F1B55CF-6A56-4154-A5C1-67F76EBB6184@fb.com>
From: Patrick Venture <venture@google.com>
Date: Sat, 20 Oct 2018 09:05:00 -0700
Message-ID: <CAO=notz-_GvQnO+FJVipS8FkfQ8fsm_1ie57DdHNKamxk-8mFg@mail.gmail.com>
Subject: Re: fru inventory update
To: vijaykhemka@fb.com
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
X-List-Received-Date: Sat, 20 Oct 2018 16:05:16 -0000

On Fri, Oct 19, 2018 at 4:41 PM Vijay Khemka <vijaykhemka@fb.com> wrote:
>
> Hi,
>
> I am trying to read fru data of my board and created a config.yaml. I not=
iced few things that there is only 5 field updated in system/xyz.openbmc_pr=
oject.Inventory.Decorator.Asset even though I have more field requested in =
config file. And also how do I get meaningful key string instead of value0,=
 value1. Please see below config.yaml and inventory file.
>
>
>
> Config.yaml
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
>   /system:
>
>     entityID: 3
>
>     entityInstance: 1
>
>     interfaces:
>
>       xyz.openbmc_project.Inventory.Decorator.Asset:
>
>         SerialNumber:
>
>           IPMIFruProperty: Serial Number
>
>           IPMIFruSection: Product
>
>         Manufacturer:
>
>           IPMIFruProperty: Manufacturer
>
>           IPMIFruSection: Product
>
>         Model:
>
>           IPMIFruProperty: Model Number
>
>           IPMIFruSection: Product
>
>         PrettyName:
>
>           IPMIFruProperty: Name
>
>           IPMIFruSection: Product
>
>         Version:
>
>           IPMIFruProperty: Version
>
>           IPMIFruSection: Product
>
>         AssetTag:
>
>           IPMIFruProperty: Asset Tag
>
>           IPMIFruSection: Product
>
>         CustomField1:
>
>           IPMIFruProperty: Custom Field 1
>
>           IPMIFruSection: Product
>
>         CustomField2:
>
>           IPMIFruProperty: Custom Field 2
>
>           IPMIFruSection: Product
>
>
>
>
>
> system/xyz.openbmc_project.Inventory.Decorator.Asset
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
>
> {
>
>     "value0": {
>
>         "cereal_class_version": 1,
>
>         "value0": "",
>
>         "value1": "WTF17370D2MA1",
>
>         "value2": "Wiwynn",
>
>         "value3": "",
>
>         "value4": "B81.00X01.0104"
>
>     }
>
> }
>
>
>
>
>
> Please advise here as what am I missing.

It's my understanding that the FruSection field matters, and if it
doesn't match it won't populate that aspect of it.  Yours are set to
"Product" everywhere, however, perhaps they should be "Board" or
something else, that indicate different sections.
>
>
>
> Regards
>
> -Vijay
