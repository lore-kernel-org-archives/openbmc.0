Return-Path: <geissonator@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4003:c06::22c; helo=mail-oi0-x22c.google.com;
 envelope-from=geissonator@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="MU3sKvH+"; 
 dkim-atps=neutral
Received: from mail-oi0-x22c.google.com (mail-oi0-x22c.google.com
 [IPv6:2607:f8b0:4003:c06::22c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40wDCz4xmDzDqGD
 for <openbmc@lists.ozlabs.org>; Tue, 29 May 2018 22:53:00 +1000 (AEST)
Received: by mail-oi0-x22c.google.com with SMTP id a6-v6so12924592oia.2
 for <openbmc@lists.ozlabs.org>; Tue, 29 May 2018 05:53:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=fNjMZ9x5eP3vcyJnObGTRiHguBWFOHNdRdr2iMTODyo=;
 b=MU3sKvH+DofmX8kT/R832eH4T6HSnE9BB1nhrMEc3QfdmlxZVFUCv+svOzG8XZWouc
 B1V5McLXKro2kmvsM87BGOPv4YivK51JGFhrc72sotwaV9X44OBg3Q8ip5gzbF08sj79
 lOm668eA55XaBin2THJTxsEDgBQ+Vx2czG6IG4y3ICrDTPRwmHA9Dpjy9+rMOojtxnij
 hdkXaLnZJp6XVu6CTfvJJtDYaZ6cJt5tpSn5aLIJSuuh6iBJ84md+PiIRo6sQz7az0eF
 0JfDzhm2DgVkb2OkzWrGTnkD5xawGllzXgtH/3kJb0YwjXR2Me0W/zdf7dYhgfFBI8dm
 dzZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=fNjMZ9x5eP3vcyJnObGTRiHguBWFOHNdRdr2iMTODyo=;
 b=GyBhiEmAa1AgIsvszjIZ7p6JR2nF+qbsg1TYkzE22ZJG/5djIvKyO1Qmx0YPGFI7Pt
 fafKB0yMpkqnzSrzlBMaEiPEQAYAdzM52/07ixXwhba11ni2/OJCFkEN9pXftLP1YVL1
 w7oGrykSkbIiAFxQhSHGglL3puvVWkkjpABU+322VFHyrf3DsoJZ/uI776hC1bxMh0Qa
 RDd9iEIjBRzYUs7MKKg77Z0fdpjRxMUhspU7ommuSabGHtwMynhOtngZ9Q4xztrqq2ML
 XYH0VWAVuMVOL2yUIU54QUaV7x5hfUgSnWWww3P4NsKibtad5qFoInYTvW9dZlNjREij
 OP0w==
X-Gm-Message-State: ALKqPwfLL/ksKtCYvTCdrtMgTDr683HXxoD+AqEsfD9aSrbCaVGsW8Jt
 dniydtCLMIVBaw8iLKIxUevV/jjuQB+nDry7cZI=
X-Google-Smtp-Source: ADUXVKJGzhYovCrgCX7+LVs6Vgsq8BSO2Uru2zGQkWGnRgUW/Gyd/Beui600rYNbSSWWf/O9qFQ4M12btbJRHP8icX4=
X-Received: by 2002:aca:4a54:: with SMTP id
 x81-v6mr5184824oia.211.1527598378148; 
 Tue, 29 May 2018 05:52:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:3262:0:0:0:0:0 with HTTP; Tue, 29 May 2018 05:52:57
 -0700 (PDT)
In-Reply-To: <6A9E4639-55AA-4DE5-B62B-92056DBB2AAD@gmail.com>
References: <6A9E4639-55AA-4DE5-B62B-92056DBB2AAD@gmail.com>
From: Andrew Geissler <geissonator@gmail.com>
Date: Tue, 29 May 2018 07:52:57 -0500
Message-ID: <CALLMt=qtHsCdKt7_srpdqwggxMOCxr+W7Qn_9VdrR3Ly+fawgA@mail.gmail.com>
Subject: Re: Fail to start org.openbmc.managers.System.service
To: Brad Chou <chou.brad@gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Tue, 29 May 2018 12:53:04 -0000

On Mon, May 28, 2018 at 5:02 AM, Brad Chou <chou.brad@gmail.com> wrote:
> Hi all,
> I have s problem while start the org.openbmc.managers.System.service
> The log says it fail to import obmc.inventory
> Then every other service that required org.openbmc.managers.System.service just forced to be stoped.
> Can anyone tell me what the obmc.inventory is ?
> How can I fix this problem ?

This inventory module comes from
https://github.com/openbmc/skeleton/tree/master/pyinventorymgr

I believe all you need to do is ensure you bring in this recipe when
you build your image:
https://github.com/openbmc/openbmc/blob/master/meta-phosphor/common/recipes-phosphor/chassis/obmc-mgr-inventory.bb

Your image should then have the inventory module:
ls /usr/lib/python2.7/site-packages/obmc/
__init__.py   __init__.pyc  dbuslib       enums.py      enums.pyc
inventory     mapper        sensors.py    sensors.pyc   system
utils         wsgi

> Thanks.
>
> May 25 11:20:58 system_manager.py[1015]: Traceback (most recent call last):
> May 25 11:20:58 system_manager.py[1015]:   File "/usr/sbin/system_manager.py", line 15, in <module>
> May 25 11:20:58 system_manager.py[1015]:     import obmc.inventory
> May 25 11:20:58 system_manager.py[1015]: ImportError: No module named inventory
> May 25 11:20:59 systemd[1]: org.openbmc.managers.System.service: Main process exited, code=exited, status=1/FAILURE
> May 25 11:20:59 systemd[1]: Failed to start Phoshpor System Manager.
> May 25 11:20:59 systemd[1]: org.openbmc.managers.System.service: Unit entered failed state.
> May 25 11:20:59 systemd[1]: org.openbmc.managers.System.service: Failed with result 'exit-code'.
