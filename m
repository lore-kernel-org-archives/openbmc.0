Return-Path: <christopher.lee.bostic@gmail.com>
Received: from mail-wm0-x244.google.com (mail-wm0-x244.google.com
 [IPv6:2a00:1450:400c:c09::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t6Vy22xkbzDvRn
 for <openbmc@lists.ozlabs.org>; Mon, 31 Oct 2016 08:29:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=00DnRgDl; 
 dkim-atps=neutral
Received: by mail-wm0-x244.google.com with SMTP id c17so15870983wmc.3
 for <openbmc@lists.ozlabs.org>; Sun, 30 Oct 2016 14:29:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=Nd1tyHjEONevFUXQStIgR2EfJfQT4CgMkKFClpLqUQU=;
 b=00DnRgDld7G03TrDkNOnhz5OGgiYcuC7h7b/JJHCXhR1uA7lV3SFQmXZF9FAwcH6ue
 ctgdNdJjuTCuduIs7QIDcQ8V//RiTIKO9HpdSFoqDFbcgdBVIJgIfzd7wZhmUb1G4kWh
 YfYKyr6szjYgelKtYwJFSdWBhIP6nO0CfVEAQbuF6UNkGAztANGWCWP8o2wHQ4L33qmh
 muKURfuRpFi8HpVDhPC7wUYEMKiUCiwMceTdcZn7mITeXm+F/y1QpKxcZS0B/W2LGabV
 P3gbswt7RFDyX4JAq4tqhSwYrWdn5Z/gJCXCSYElBTIwWdbDsXDN6VzIPRytCFz/krPH
 cKHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=Nd1tyHjEONevFUXQStIgR2EfJfQT4CgMkKFClpLqUQU=;
 b=HeF/kN85G6Xdn5PGyyomL5ZL2IxO6+OsIZ5jFMbFOaLPG/HMmYTOchv9YSZgTEdnKA
 xv24nw87O5XEVv7FExxRHTK9k2EHuOjluijU/2oFY04md54ZbZAF4LX5VoJP2TYSMHmS
 LahskJLDE+GCvzmADFuYHCgpyLoghNkmKbXBnQPoMHijul55NVLWtFRMomU2i+RJpjSP
 HHCABEAQ7mST1zX/l7Ql4rjRVGnymHEFeDA8A9p2Nz5FPOJAwFKTGzc2QXEHZr7dYdlS
 sxiPxga4mt9KoNyetZgx7gJqFT57V9Rd3xr23/9YEXgOiRMNygQfNUeH5kGisnOWAYgP
 6lsg==
X-Gm-Message-State: ABUngvcA7fpgwSagxv4I2mT/HSoIw7iZldgTcPL+lUz6kfpYCeQhv3MtPUU/Arj2x/HUwdy0g3NGydrolGaWIg==
X-Received: by 10.194.190.233 with SMTP id gt9mr19802181wjc.46.1477862981935; 
 Sun, 30 Oct 2016 14:29:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.161.71 with HTTP; Sun, 30 Oct 2016 14:29:41 -0700 (PDT)
In-Reply-To: <60fa3f67-10c7-8f58-ed43-3e82a4498c57@ozlabs.org>
References: <1476918586-13475-1-git-send-email-christopher.lee.bostic@gmail.com>
 <1476918586-13475-16-git-send-email-christopher.lee.bostic@gmail.com>
 <7393b875-d655-a4ea-afd7-9368ca05d90b@ozlabs.org>
 <CAA0LjjW4RHRb45XUtW-gk_g_Ro3aqwrxj9ZGFct0nG0NFYjbpQ@mail.gmail.com>
 <60fa3f67-10c7-8f58-ed43-3e82a4498c57@ozlabs.org>
From: Christopher Bostic <christopher.lee.bostic@gmail.com>
Date: Sun, 30 Oct 2016 16:29:41 -0500
Message-ID: <CAA0LjjVhUqySVUPwCGFfHZB24ay_1OSTOoj5RR27zxrL6cP4rw@mail.gmail.com>
Subject: Re: [PATCH linux v5 15/18] drivers/fsi: Add GPIO FSI master
To: Jeremy Kerr <jk@ozlabs.org>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, xxpetri@de.ibm.com, 
 Jeremy Kerr <jk@0zlabs.org>, zahrens@us.ibm.com
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
X-List-Received-Date: Sun, 30 Oct 2016 21:29:47 -0000

>
> Say if we have a FSI master with two links, we would have four cells
> for all the *-gpios properties:
>
>      fsi-master {
>          compatible = "ibm,fsi-master", "ibm,fsi-master-gpio";
>          clk-gpios = <&gpio 0 &gpio 6>;
>          data-gpios = <&gpio 1 &gpio 7>;
>      }
>

Hi Jeremy,

One thing I don't understand is the numbering conventions.   What does
6 and 7 represent in this case?
There are five pins total 0-4 for the existing gpio master.  I've
followed the numbering as is listed here
in the latest patch set I'm submitting this afternoon.

> - and the binding would remain as is (just that we should use the plural
> of gpios for the property names, to make this a little more sensible).
>
> This could also be represented as two separate master nodes:
>
>      fsi-master {
>          compatible = "ibm,fsi-master", "ibm,fsi-master-gpio";
>          clk-gpios = <&gpio 0>;
>          data-gpios = <&gpio 1>;
>      }
>
>      fsi-master {
>          compatible = "ibm,fsi-master", "ibm,fsi-master-gpio";
>          clk-gpios = <&gpio 6>;
>          data-gpios = <&gpio 7>;
>      }
>
> Our choice there would depend on the hardware layout. Does is make more
> sense to represent this as two independent masters? Or a single one?
> Would there ever be any shared state between those two masters that a
> driver needs to handle?

Up until now, all available FSI masters in hardware,  FSP, P8 "hub", P8 cascade,
P7 cascade, have all had multiple links controlled by one master.   It would
make sense I think to continue this.

There is no direct sharing of information between masters other than what's
required by the firmware to start at the beginning master in the chain and
walk down each link  and checking 'sub' master states to determine where an
interrupt or error was sourced.

General flow:
Identify on which link interrupt / error was reported.
Look at each CFAM on that link to see if it was reported locally or downstream
if downstream,  Look at the cascaded master's owned links to see which
reported.  Etc..

In my opinion that type of master to master information is better kept separated
as it is in the interests of keep a general design common between real hardware
FSI masters such as the FSP's and the gpio type master implementations.

>
> Once we've settled that, we will need the device tree binding people to
> take a look, which just involves CCing devicetree-discuss@ozlabs.org for
> patches that modify Documentation/devicetree/*.
>
Will keep them off the cc list for now until we all agree which way we go.

Thanks,
Chris
