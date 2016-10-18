Return-Path: <christopher.lee.bostic@gmail.com>
Received: from mail-oi0-x241.google.com (mail-oi0-x241.google.com
 [IPv6:2607:f8b0:4003:c06::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3szBg922m1zDt3K
 for <openbmc@lists.ozlabs.org>; Wed, 19 Oct 2016 10:51:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=oc7jmJY5; 
 dkim-atps=neutral
Received: by mail-oi0-x241.google.com with SMTP id d132so593055oib.2
 for <openbmc@lists.ozlabs.org>; Tue, 18 Oct 2016 16:51:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=PzSXg0AnFDsR+BcWbXwsEy6a+tMZ4G+nZ46B5PO/v50=;
 b=oc7jmJY5h+u/8SEURgdviqBPxh3wSXFB7Jllj1hSJQTMhXFzzTNgfG0fZAO9GOc9BB
 o61S5lKpbAirNs0PB6aCuyqzrR3BL6EVCIyTN+ACWNevrQI65/d/QuyP4EPr8oD9zw5D
 I/kMGT/JDqPaDlfye0LnUP9GtwgAa9y9X/QOTEwOxSJnRh3zdhgKPuUVCdYSpqZkt9h3
 SFe1FsWYIGhhp3nt6df5OlNR+bfssHFP4j3NWSf0qGTWiEWsfsvt8gy/2P9anj2g29mu
 kuEich8Ezg8Ee3ro9tNd9DxJaknPUMANhxtK9qObSZPbU8Ig8g+s3/hk0176MkV1Ouul
 8bqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=PzSXg0AnFDsR+BcWbXwsEy6a+tMZ4G+nZ46B5PO/v50=;
 b=YI5FTL7VenHZzbXqvbIFucv2Kj7ibuoaO9Wlv5D+sYPjuwOJANbagQCIEoYasIVC3j
 37h0kF5MIcF3qjvzVf3slt5v3j8HleBNJ/NjseRhm2Xo3DZ8m9oIz6U865P6A+d/zpbI
 tk0i70x6BiY+hBO1/otdKm/yw36vVpNY9ECTxM6i/wy2+rT6L8bZRxuzPHr6Br3sr7PQ
 fXGClL5ahxhxQzPe7Z6SozoQcp8lvC8bstL49c0PVfbNpW26j2UYpn0FqW/WMeuAuNP3
 FqbMjRXen9wACQ2VOQQj3wSrbdalcCvxg3RqT4fSU0e8VO3ds2So4XSswc7vuBohpwe9
 M5OA==
X-Gm-Message-State: AA6/9RmDQdpqH4n628xF9onDlw/FKZJ3Vs3NcyJdLaiuiUliCqHqy3y+MIRF4AjgEPTeC0tLYhsdm6Kt1VnMJQ==
X-Received: by 10.202.7.194 with SMTP id 185mr2353387oih.26.1476834690919;
 Tue, 18 Oct 2016 16:51:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.202.221.9 with HTTP; Tue, 18 Oct 2016 16:51:30 -0700 (PDT)
In-Reply-To: <0c3c9834-aefd-30e6-bc22-577697fa7e95@ozlabs.org>
References: <1476483282-85971-1-git-send-email-christopher.lee.bostic@gmail.com>
 <57f3f105-2631-2d93-2133-55f8abb31578@ozlabs.org>
 <CAA0LjjWOqe7-z=QfUgTGY3zd796taS5H4wHARd6K7=_NEXjYhg@mail.gmail.com>
 <d1201620-e069-4fb9-6017-3df4a9844866@ozlabs.org>
 <0c3c9834-aefd-30e6-bc22-577697fa7e95@ozlabs.org>
From: Christopher Bostic <christopher.lee.bostic@gmail.com>
Date: Tue, 18 Oct 2016 18:51:30 -0500
Message-ID: <CAA0LjjXxhZsqg3t_MdGfub5-=dD7FUUD+oW=m3jq6sub2kiAZQ@mail.gmail.com>
Subject: Re: [PATCH linux v4 00/20] FSI device driver introduction
To: Jeremy Kerr <jk@ozlabs.org>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, xxpetri@de.ibm.com,
 zahrens@us.ibm.com
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
X-List-Received-Date: Tue, 18 Oct 2016 23:51:33 -0000

On Mon, Oct 17, 2016 at 8:56 PM, Jeremy Kerr <jk@ozlabs.org> wrote:
> Hi Chris,
>
>>> Sounds like a plan -Thanks
>>
>> Excellent! I'll get that done today, and let you know when my branch is
>> ready to re-pull.
>
> OK, done. The branch at:
>
>   https://github.com/jk-ozlabs/linux/tree/openbmc/fsi
>
> Now has an updated base set of commits for you to rebase onto. To do
> that:
>
>    git rebase -i --onto 2b5b3ae2 <SHA>
>
> Where <SHA> is the start of your local changes in your tree (ie,
> corresponding to 16/20). In that rebase, you'll probably want to pick
> 111f387 (my skeleton GPIO driver), which should still be an object in
> your tree, and squash 18/20 into that.
>
> Something like this for the rebase plan:
>
>   pick cfa927f fsi: Add empty fsi bus definitions
>   pick fd18ef2 fsi: Add device & driver definitions
>   pick 05d2f6d fsi: add driver to device matches
>   pick 918007d fsi: Add fsi master definition
>   pick 1493896 fsi: Add fake master driver
>   pick cd8c30f fsi: enable debug
>   pick 287b519 fsi: Add slave definition
>   pick db6d868 fsi: Add empty master scan
>   pick 60e3513 fsi: Add crc4 helpers

Hi Jeremy,

Not sure what may have happened but looks like the crc4 helper
commit 60e3513 has a build issue.

Changes made to correct:
* Added a semi colon for function prototype in fsi-master.h
* Removed the open bracket in for loop of fsi_crc4
* Renamed two instances of check_crc4 to check_crc4_u32

I had made these updates in the last patch round (v4) but I figured
you may want to have those updates in place prior to me applying 16-20.

Thanks,
Chris

>   pick 57314b2 fsi: Implement slave initialisation
>   pick 47a25ff fsi: scan slaves & register devices
>   pick 2b5b3ae fsi: Add device read/write/peek functions
>   pick <16/20> drivers/fsi: Set up links for slave communication
>   pick <17/20> drivers/fsi: Set slave SMODE to init communications
>   pick 111f387 fsi: Add GPIO master driver
>   squash <18/20> drivers/fsi: Add GPIO FSI master functionality
>   pick <19/20> drivers/fsi: Add client driver register utilities
>   pick <20/20> drivers/fsi: Add SCOM client driver
>
> Where <xx/20> is the actual SHA of the commit, of course. These will
> automatically be provided by the rebase.
>
> Then, when squashing the GPIO patch, set the author to you, keep my
> signed-off-by, and reword the commit message to the entire change.
>
> Cheers,
>
>
> Jeremy
