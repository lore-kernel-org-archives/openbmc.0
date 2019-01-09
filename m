Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::42f; helo=mail-pf1-x42f.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="uotVHRhP"; 
 dkim-atps=neutral
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [IPv6:2607:f8b0:4864:20::42f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43Z8xj0h6PzDqYk
 for <openbmc@lists.ozlabs.org>; Wed,  9 Jan 2019 11:23:52 +1100 (AEDT)
Received: by mail-pf1-x42f.google.com with SMTP id c123so2753650pfb.0
 for <openbmc@lists.ozlabs.org>; Tue, 08 Jan 2019 16:23:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gJHv2+kcF9PEXwByQeaDnktYYIJMLqq0nVBrhXM2sMY=;
 b=uotVHRhP0+i80yCfpaTnENkdD4mjjkONADw8UJVqGtipLgyhCqXLnJ9naJCUXKxQFt
 E76RYQ0NTfCHrvU9uG9iKaoRpPmRKIBAWjb0ueWNLFSQgRSrm6Vm3PbkvH1HZdUP8euq
 FUOhBsV+bNDexF9w7FoN0kPvD4TbqEPsoU+J+e58iMqQ2KySQ0rQ8Lu0gASG4NUXhCMg
 TQp0JATromRVztkbV/DlH67/8AoRTTIlsbv9SscYEvolBLmIlH/mtsYDuQ0/fuXA4B6O
 1zCKdeZ5s/qR+31HGN9NP24qmiVnQ/sBn1BFa8QhYcbdF0l3crqcFjDgnJAMUNTS7FgW
 lJNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gJHv2+kcF9PEXwByQeaDnktYYIJMLqq0nVBrhXM2sMY=;
 b=OLy1Uzg47R2bGkitVYrCWLmpdD2DE9RlX5WSxQZIsMD3cUfhQiariDOdBJ9xszU3zM
 0tfBAsqCRX7YjYewvn8QkqAavw5W4VFdFALjCNpZYaKVX1N5Y7BHrABFQO8DegF2q6su
 g7j2IzOwwWRdxwc83nMRO7iah52AsD8RCuzIq5ccc6ZIl3nkv3sBvrNn/EHUd1hpeDM7
 wf+5oL6NGVHoaX4fuXXogE7jPiHxrj2QCvPnmKh58+Jp4bRvvuOMeRsDy8HTRXj8TMo+
 cfEPz0grYNTTYIcB4Uicjzm5lxZIyRzpa3FV/QPiu/U5FuRJvziD9tXlsr82hJpYGaaQ
 MhhQ==
X-Gm-Message-State: AJcUukdyNaECTBNnsME+mrKPaLYMAJ0ycZRGtScp7JY1F2I80KiZsKhT
 trT+t3M4eQR0QJQpwOITKVXn10fTWdsyAoWk3juIwQ==
X-Google-Smtp-Source: ALg8bN6c9dbeBSCcY3dXMX+aiSHGZ39ukK7KITHucuyh1gz8Zf4di1mfkp0Ih8G7UotkObrMnzfyt+S6VMBG5YteWVU=
X-Received: by 2002:a63:4d:: with SMTP id 74mr3508795pga.248.1546993429721;
 Tue, 08 Jan 2019 16:23:49 -0800 (PST)
MIME-Version: 1.0
References: <CAO=notxXfcvs0SfBLoR5MCqt+AHA-V+7j4TRWmaKgxm0pqUFHw@mail.gmail.com>
 <CADKL2t6aW8CzLYX_DdN6-_ueSkeVSLsoA=ymwn0_Wr-U97cNDQ@mail.gmail.com>
In-Reply-To: <CADKL2t6aW8CzLYX_DdN6-_ueSkeVSLsoA=ymwn0_Wr-U97cNDQ@mail.gmail.com>
From: Patrick Venture <venture@google.com>
Date: Tue, 8 Jan 2019 16:23:38 -0800
Message-ID: <CAO=notwBQahZKpxwK6M_C9Fc0_U94ryhVOjSbPDOU0fUrR7VPg@mail.gmail.com>
Subject: Re: Unable to override file by machine for
 phosphor-ipmi-fru-properties
To: Benjamin Fair <benjaminfair@google.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, Nancy Yuen <yuenn@google.com>
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
X-List-Received-Date: Wed, 09 Jan 2019 00:23:54 -0000

On Tue, Jan 8, 2019 at 2:29 PM Benjamin Fair <benjaminfair@google.com> wrote:
>
> On Tue, Jan 8, 2019 at 2:22 PM Patrick Venture <venture@google.com> wrote:
>>
>> With phosphor-ipmi-fru-properties, if we set the
>> FILESEXTRAPATHS_prepend to be machine specific, it can't find the file
>> and doesn't add the path, but if we leave off the machine override,
>> it'll find the file and use it.
>>
>> https://github.com/openbmc/meta-ingrasys/blob/master/meta-zaius/recipes-phosphor/ipmi/phosphor-ipmi-fru-properties%25.bbappend
>>
>> This specifies that for zaius, it should prepend with this path and
>> use this override file.
>>
>> Deleted the extra-properties.yaml file from the original recipe and
>> tried building zaius:
>>
>> WARNING: phosphor-ipmi-fru-properties-native-1.0-r1 do_fetch: Failed
>> to fetch URL file://extra-properties.yaml, attempting MIRRORS if
>> available
>> ERROR: phosphor-ipmi-fru-properties-native-1.0-r1 do_fetch: Fetcher
>> failure: Unable to find file file://extra-properties.yaml anywhere.
>> The paths that were searched were:
>>     /usr/local/google/git/workspaces/building_122514933/meta-phosphor/recipes-phosphor/ipmi/phosphor-ipmi-fru-properties-1.0/df-openpower
>>     /usr/local/google/git/workspaces/building_122514933/meta-phosphor/recipes-phosphor/ipmi/phosphor-ipmi-fru-properties/df-openpower
>>     /usr/local/google/git/workspaces/building_122514933/meta-phosphor/recipes-phosphor/ipmi/files/df-openpower
>>     /usr/local/google/git/workspaces/building_122514933/meta-phosphor/recipes-phosphor/ipmi/phosphor-ipmi-fru-properties-1.0/gbmc
>>     /usr/local/google/git/workspaces/building_122514933/meta-phosphor/recipes-phosphor/ipmi/phosphor-ipmi-fru-properties/gbmc
>>     /usr/local/google/git/workspaces/building_122514933/meta-phosphor/recipes-phosphor/ipmi/files/gbmc
>>     /usr/local/google/git/workspaces/building_122514933/meta-phosphor/recipes-phosphor/ipmi/phosphor-ipmi-fru-properties-1.0/
>>     /usr/local/google/git/workspaces/building_122514933/meta-phosphor/recipes-phosphor/ipmi/phosphor-ipmi-fru-properties/
>>     /usr/local/google/git/workspaces/building_122514933/meta-phosphor/recipes-phosphor/ipmi/files/
>>     /usr/local/google/git/workspaces/building_122514933/meta-phosphor/recipes-phosphor/ipmi/phosphor-ipmi-fru-properties-1.0/x86-64
>>     /usr/local/google/git/workspaces/building_122514933/meta-phosphor/recipes-phosphor/ipmi/phosphor-ipmi-fru-properties/x86-64
>>     /usr/local/google/git/workspaces/building_122514933/meta-phosphor/recipes-phosphor/ipmi/files/x86-64
>>     /usr/local/google/git/workspaces/building_122514933/meta-phosphor/recipes-phosphor/ipmi/phosphor-ipmi-fru-properties-1.0/
>>     /usr/local/google/git/workspaces/building_122514933/meta-phosphor/recipes-phosphor/ipmi/phosphor-ipmi-fru-properties/
>>     /usr/local/google/git/workspaces/building_122514933/meta-phosphor/recipes-phosphor/ipmi/files/
>>     /usr/local/google/git/workspaces/building_122514933/build/downloads
>> ERROR: phosphor-ipmi-fru-properties-native-1.0-r1 do_fetch: Fetcher
>> failure for URL: 'file://extra-properties.yaml'. Unable to fetch URL
>> from any source.
>> ERROR: phosphor-ipmi-fru-properties-native-1.0-r1 do_fetch: Function
>> failed: base_do_fetch
>>
>> Ok, it can't find it.  But when I delete the machine override on the
>> line, basically delete "zaius" it then finds the file and uses the
>> zaius file correctly.  This behavior is baffling me, does anybody have
>> any ideas?  Has anyone seen this behavior?
>>
>> Patrick
>
>
> That's because this is a native package. Native packages don't set the MACHINE within the overrides variable so there's no way to tell what machine they're being built for.

Thanks, that makes sense.
