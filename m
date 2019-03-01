Return-Path: <mine260309@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::d36; helo=mail-io1-xd36.google.com;
 envelope-from=mine260309@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="IQqWdpnn"; 
 dkim-atps=neutral
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com
 [IPv6:2607:f8b0:4864:20::d36])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 449XbP1VKZzDqDW
 for <openbmc@lists.ozlabs.org>; Fri,  1 Mar 2019 12:56:48 +1100 (AEDT)
Received: by mail-io1-xd36.google.com with SMTP id 9so6524196iog.8
 for <openbmc@lists.ozlabs.org>; Thu, 28 Feb 2019 17:56:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=c55R5uTkzrV9QciPc97NkffGDOQsqnIEpCALzQNAZpc=;
 b=IQqWdpnnxdGYRRcWBADPC2jnm8+GvpX4vMFctc0bDgAa5Xh35KkmEoKx4nJu6O3IrG
 iBeyHMpeqC0H9do3Rs8x0Zy1J9yxyOFIxxzESo+Vb4zNpISz3K8g7XMl4va1JcpaG9N/
 9xegABonxxcWoL0Gr+W/yiWrzdn0Ha6kpvTn57gPIbEg4nTpafHu54NcmW1qL7hxqCbv
 AGCFxj6XYnlq5MLARiEak9UH+tldAAJiP/3SNSkJ82Se0aU3RoJjxLQE/DTYEKbJxqcR
 t0OBj+ss+tLAVNmkKZVUa0Saw8ael4l1sRgrHAokvv9PklEVV05Mm292qrkAjup9VyZO
 MEDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=c55R5uTkzrV9QciPc97NkffGDOQsqnIEpCALzQNAZpc=;
 b=VYRuf85Wjge+Q8UlbVA7Dyw33FukzAmhQ86h6RLcJSjfeCItJG6pEpchHGagkj2lv7
 gS9w2wspGfuat/0CXXCXV0paPzBXgtmDkQ4sRmFOLkUTVYSIKZFWrplGSGgVUroYexO+
 RIqgo+Nrq8g8PsSIKj+QPhnccCgDOQ0GBBtiYzo2nU2j6gMwLG6zJRNIh7SmVuB/mxk4
 zvT9yACX2rUNRLNlxiUL3H157wVUlq2dO1aEx6mKBX2mpPBh3ndUSGYTmBtbHYmi16q9
 MXz1vCwClF87sIkQKxPUuArpvKDFnS+JtJflezywHF7gAZf+sZQJAjDzl1c2smWxSxrS
 50gQ==
X-Gm-Message-State: APjAAAUQMYJC6jjALiv8cTvEwLn2N1nbbus7drbofqm0Juolll3vLfmj
 oncVdrcnYK2lgmIvY1YOc+WmZzlkmXyFJBMPbmM=
X-Google-Smtp-Source: APXvYqxBn+XkYhE7UCICqXF8ePhlqc6RyZ7Tj+o8D0yDdHZUGF2GVfvWo881phxJw6EE2sW+PrUJf4Ooa16gwtyC09M=
X-Received: by 2002:a6b:8d55:: with SMTP id p82mr1419448iod.171.1551405405620; 
 Thu, 28 Feb 2019 17:56:45 -0800 (PST)
MIME-Version: 1.0
References: <CAARXrtmaOQJ9a224iosU1m+5FSryC4TM7qgBT3n9MYPWzZiQrQ@mail.gmail.com>
 <877edjsazm.fsf@linux.vnet.ibm.com>
 <6da2e0e6f04ed7bb152db5008137680fc761ed42.camel@mendozajonas.com>
 <87pnrbqs8r.fsf@linux.vnet.ibm.com>
In-Reply-To: <87pnrbqs8r.fsf@linux.vnet.ibm.com>
From: Lei YU <mine260309@gmail.com>
Date: Fri, 1 Mar 2019 09:56:28 +0800
Message-ID: <CAARXrtmX6np4jaeDnv_EAMfrLCKi+xGOX6rmy17ov2kLrP+qrg@mail.gmail.com>
Subject: Re: Static layout PNOR support in openpower-pnor-code-mgmt
To: Stewart Smith <stewart@linux.ibm.com>
Cc: Samuel Mendoza-Jonas <sam@mendozajonas.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 Alexander Amelkin <a.amelkin@yadro.com>
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
X-List-Received-Date: Fri, 01 Mar 2019 01:56:50 -0000

> >> Is this a new format? Why? Where is it documented?
> >>
> >
> > Looking on gerrit this just appears to be the PNOR and a MANIFEST file in
> > a tarball. Considering it's just a call to 'tar', having it be generated
> > by something called 'generate-squashfs' is confusing. I guess this is
> > because generate-squashfs creates the MANIFEST file?
>
> Yeah, that sounds odd. The current format is just the pnor file.

Yeah, it is a bit odd, I just want to re-use the code in 'generate-squashfs'
to generate a tar that contains MANIFEST and the pnor.
Possibly it could be renamed to `generate-tar`or similar.
Be noted that this file is used to generate Witherspoon's PNOR tarball in
op-build. So renaming it should cause op-build to pick the new name.
