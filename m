Return-Path: <mine260309@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4001:c06::232; helo=mail-io0-x232.google.com;
 envelope-from=mine260309@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="piebFT76"; 
 dkim-atps=neutral
Received: from mail-io0-x232.google.com (mail-io0-x232.google.com
 [IPv6:2607:f8b0:4001:c06::232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41gH123qCxzF19q
 for <openbmc@lists.ozlabs.org>; Wed,  1 Aug 2018 12:13:58 +1000 (AEST)
Received: by mail-io0-x232.google.com with SMTP id l7-v6so14801541ioj.1
 for <openbmc@lists.ozlabs.org>; Tue, 31 Jul 2018 19:13:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BKzatoha9EI5q8/B4pdIaS6JlPzCejz+HAGYQaTuVB8=;
 b=piebFT76xiIxcuWTR16W3TSZraaoxXsffIMU8ijjgmb8mxpfKqQfs1BLzst4I1fZND
 m6OP/cbk2SjxXGXBs3lUAchWDZo+suQ+3COiEB47CqAipohpFeMtbLqsOoNqEkC2feKk
 FTbifZ/MPsUPkQpzSApVGxMXiHHGg1krEbY/xFSjER7905kfBNfp1VUmyW60RzC1jUUE
 f9xcXFQZaYNsVmrAmUHsK+kCKniN54cOoMWE7f8h/O65tu1pI3SgwKq7ytpmazFP5nzX
 3sWa7++Dji5xxWybINKo+EUyjZgMd4jQWmJGJVgcDpyxolZJAwcCNgrxZB1cteMuXv7h
 z62g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BKzatoha9EI5q8/B4pdIaS6JlPzCejz+HAGYQaTuVB8=;
 b=gp3b860OSWABjGOd3xSS3CAOyxbup6KaTaQdypyMaRe9gxw+OMoCUnZeNVPr+C7Are
 JblECIlb2ukyMr2jJYJd/rhLHsAZl+udZBq9NWiBbkiEkdqGSsPwauo41S3wTnSixoUA
 Gx6RQsYkcB/p5rz2fIt9QjnrQpweraoV2YBbT+Ln+4xlUZO6piHXG7gy56mkWvOSsNUz
 QeNfsGjQnnS2AonVy7d/9Bmn4A/dE3+N0e/G7ncBngl9Nhc8Wn2M34ddESlCmDi5JrLa
 trTolUVQ0nQcaVCVi50WjEpMTEMNMKKEsTETcBEmrPO9GsCjzqB44yYJASu+hjsDIl7X
 KXqA==
X-Gm-Message-State: AOUpUlHI6REw3PqPbch6hxohbf2HjJhGBKvHC4mNM4XLBOpNwY0/c8jE
 nRlGbb9QdxnyEtsZKMgAvj7mogI3ZfL4/UVmP8c=
X-Google-Smtp-Source: AAOMgperRNnHRPvGB/YqIn6JVCO3NlUUC0oPi+ohcx8kRMbmMmn3tRyUV0BBnMskMftxQhtrz/XGLiArajhhfcURhBs=
X-Received: by 2002:a6b:889f:: with SMTP id
 s31-v6mr1752135ioi.156.1533089636213; 
 Tue, 31 Jul 2018 19:13:56 -0700 (PDT)
MIME-Version: 1.0
References: <1F65CF12-B31E-409C-BD72-D1CF3D0CFBFC@fuzziesquirrel.com>
 <ab15c434-61ee-394a-fe89-d211018b8f3e@linux.vnet.ibm.com>
In-Reply-To: <ab15c434-61ee-394a-fe89-d211018b8f3e@linux.vnet.ibm.com>
From: Lei YU <mine260309@gmail.com>
Date: Wed, 1 Aug 2018 10:13:40 +0800
Message-ID: <CAARXrt=PXyNzC21UmjDVrv3m90O+TBrKuOsEeU5HOyx=Brzb=A@mail.gmail.com>
Subject: Re: [Maintainers] Call for maintenance
To: Patrick Venture <venture@google.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, bradleyb@us.ibm.com,
 wak@google.com, tomjose@linux.vnet.ibm.com
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 01 Aug 2018 02:13:58 -0000

On Tue, Jul 31, 2018 at 10:21 PM Tom Joseph <tomjose@linux.vnet.ibm.com> wrote:
>
> Hello,
>
> I am scrubbing the phosphor-host-ipmid to handle the SdBusError exception.
>
> Even though sdbusplus::exception::SdBusError is inherited from
> std::exception,
> my observation is that catch statement of std::exception does not catch
> sdbusplus::exception::SdBusError exception.
>
> try
> {
>      // Statement throwing sdbusplus::exception::SdBusError exception.
> }
> catch (const std::exception& e) // Does not catch
> sdbusplus::exception::SdBusError
> {
>
> }
>
> I think the multiple inheritance from std::exception is causing this.
>

Yup, I meet the same issue.
The root cause is multiple inheritance of std::exception:

    struct exception : public std::exception;
    struct internal_exception : public exception;
    class SdBusError final : public internal_exception, public
std::system_error;

SdBusError inherits both internal_exception and std::system_error,
which both inherit std::exception.
We can not use virtual inheritance here because std::system_error
already non-virtually inherits std::exception.

So probably we should not use diamond inheritance here...
