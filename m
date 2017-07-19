Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x242.google.com (mail-yw0-x242.google.com
 [IPv6:2607:f8b0:4002:c05::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xCBjt674WzDrVn
 for <openbmc@lists.ozlabs.org>; Wed, 19 Jul 2017 19:36:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="rj1EkRHy"; 
 dkim-atps=neutral
Received: by mail-yw0-x242.google.com with SMTP id a12so2325164ywh.1
 for <openbmc@lists.ozlabs.org>; Wed, 19 Jul 2017 02:36:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=AyVyyL7UaAjkO8spd1+II9vHgPBjoYpcg0mYimYy7rA=;
 b=rj1EkRHyeCqKPV9ebo0uV4C84QnSnkiTOwGKWJZA5rH3n1hvdtXAPK/oeCyGa+GnhU
 48neqLL6On6UKehgJZs9ZzhisZImfpabiRPe0tJu/p8UV4iM2aQRxfo8urxPWQvp3kIz
 EWmlfErAHvN1KfmLG2n56UFEhehcs/HMxaH4raDYZyKMHyZSIieecwy15It+Ok0WFcQv
 QDc1rXel+sZMvs6QOHDdOx0n+4QI4JKnq7CQvXVQNt4nTTUN9oxosvH0JE/Atbiy+0G2
 RZER1SGzAibI8UIxAdwO1ySc6Kt8Mtuu44DuxPi2s/NR9K4mKZa2DJIWy3LG6LBH+pwK
 0vkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=AyVyyL7UaAjkO8spd1+II9vHgPBjoYpcg0mYimYy7rA=;
 b=MyMGlbU4VNuMCyBvpHhhnaQ7FaqZ15zB8pbZj6KtjxGTQ73qg+9r7hGnBdbRleRt+W
 AaCu7+LylNoi6Wvd03T2KMOmRK8V29GLgLiDPc+y2ot302Hgk5Auj5SzMs2I40wr3wf7
 igmrqJ+LnT7WNjo4d8bxTMF6nJZMZ+Mv5rPmRhxGr0Uzjez46sWsrLvGaSOeqKuZjDj4
 vcWPdRNuS77ZkbYVI8SG27N/+93KELLUIAK7ffnF8UjM5qc/ng/nIlQIUE1/RLOEkjO8
 ROBGLWTXg63wPbOtLUyt93G73NQLGZBHndoudzo4MTEz5GbDV17E2hCp+8MmTssg2Why
 ZMfw==
X-Gm-Message-State: AIVw1113van0c8hXDt+t97ms21G7ermbwm03+9X2wzYtAPrA+JNGhIkC
 BORGNBuzT0Ue2CJONn0VmkeucngQFQbioYs=
X-Received: by 10.129.201.4 with SMTP id o4mr1571199ywi.2.1500456976635; Wed,
 19 Jul 2017 02:36:16 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.170.177 with HTTP; Wed, 19 Jul 2017 02:35:56 -0700 (PDT)
In-Reply-To: <CALLMt=pRW8N=CoC7zVOgDcRcZiD_f336w4Mwh0EGOqK3RwR-Dg@mail.gmail.com>
References: <1500321334-11189-1-git-send-email-eajames@linux.vnet.ibm.com>
 <CALLMt=pRW8N=CoC7zVOgDcRcZiD_f336w4Mwh0EGOqK3RwR-Dg@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 19 Jul 2017 19:05:56 +0930
X-Google-Sender-Auth: LO_YqzfD852pmMgV77gL15ieWI0
Message-ID: <CACPK8XfJ5KJ1RO5yD=Lr_Nvor0J8-u7DBgNoGqO2Bea_SVzbfw@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10] drivers/hwmon/occ: Change power sensor
 type a0 attributes
To: Andrew Geissler <geissonator@gmail.com>
Cc: Eddie James <eajames@linux.vnet.ibm.com>,
 "Edward A. James" <eajames@us.ibm.com>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Wed, 19 Jul 2017 09:36:19 -0000

On Tue, Jul 18, 2017 at 11:15 AM, Andrew Geissler <geissonator@gmail.com> wrote:
> On Mon, Jul 17, 2017 at 2:55 PM, Eddie James <eajames@linux.vnet.ibm.com> wrote:
>> From: "Edward A. James" <eajames@us.ibm.com>
>>
>> Needed to be more standard.
>>
>> Signed-off-by: Edward A. James <eajames@us.ibm.com>
>
> Tested-by: Andrew Geissler <geissonator@gmail.com>
>
> Eddie provided me this patch (plus his zaius gpio one) up in gerrit
> via https://gerrit.openbmc-project.xyz/#/c/5243/ which I then verified
> my hwmon conf files on top of.

Thanks for the testing Andrew. Applied to dev-4.10.

Cheers,

Joel
