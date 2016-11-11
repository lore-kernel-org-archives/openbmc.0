Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x244.google.com (mail-yw0-x244.google.com
 [IPv6:2607:f8b0:4002:c05::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tFSn313twzDvbg
 for <openbmc@lists.ozlabs.org>; Fri, 11 Nov 2016 16:16:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="i1cBiWvT"; 
 dkim-atps=neutral
Received: by mail-yw0-x244.google.com with SMTP id s68so383046ywg.0
 for <openbmc@lists.ozlabs.org>; Thu, 10 Nov 2016 21:16:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=dtWG6v3Gmv8jMol9MS9az8fviZ/0qzkQcJqGy6DfUWs=;
 b=i1cBiWvTAl4rBFZOPJedccuU0oIyo5opGG7opOkuDBfXyMoQqptmPku893GB8oUEm1
 BwGt7KLolcl5n0GuGLAIoGt//B9A3IoMXM93F5j3Nthk3++PuX2i+HL141ao6aXc9LoL
 tOTpG40mkoulcUqBa+wBMxtOmCWux8BEgNzZ2hIdYX0WRM63DoA5+sPr5dCjKrUv5Fol
 CCdR+qh7UlX3jB9weCTMBtobAqJoccvYIayEkFrCFFbQ1gD3huvwJOuwEIrPs3sDih0X
 oAp+cXZ3M42l0g9F7Cz96h/EZ17X0FWyTUtLb+m95c4M/mj540ZApsci9x8b+cbGmGf0
 ifHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=dtWG6v3Gmv8jMol9MS9az8fviZ/0qzkQcJqGy6DfUWs=;
 b=iO22xK9JlLX+ZgwLz/K3S9VPBu8MEzBZW1bnQKQFrHF8i1ut5rKYZTi4ci7su8PsIG
 my8PDTN1kVLmc1h5wgEAShZzAWJB7mjCBfDKXifMg2fMhPb2Fy+386nYUl6xmvw8QFfZ
 T4EgS1EZH5c5ohhUC97SSZ5ii1nc3ubkZhD2tkeZQS3EZepOZ5wvw3ffJVSsVJv6gPmQ
 sT8vKnb6Lyg5j23rWJjwaIWW4ycoXM9FQPeeMRq/bPnunUXYTPLDSbZaTWjhfF327pwf
 0P8ugPwkjDGHfA2gI1aqEEnBhv+oqa+7gsckhB/xasIRt6YSLCR8uoF5f0cSMyeNT6sx
 Rw+w==
X-Gm-Message-State: ABUngveSoPGB1f4kiiDMW171aDWzLz52i2+UFMC0Ps8y3G3msZS8CZsDiTZPxVIsRnnvSi6hoKOno0NGn4yUBQ==
X-Received: by 10.157.60.206 with SMTP id t14mr453086otf.37.1478841364353;
 Thu, 10 Nov 2016 21:16:04 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.182.97.41 with HTTP; Thu, 10 Nov 2016 21:16:03 -0800 (PST)
Received: by 10.182.97.41 with HTTP; Thu, 10 Nov 2016 21:16:03 -0800 (PST)
In-Reply-To: <cover.1478835488.git.andrew@aj.id.au>
References: <1478560512-23791-1-git-send-email-eajames.ibm@gmail.com>
 <cover.1478835488.git.andrew@aj.id.au>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 11 Nov 2016 15:46:03 +1030
X-Google-Sender-Auth: PhY2cyCSlCBk6VGRXzpp8NfqBxA
Message-ID: <CACPK8XdzofrfSC5di2m33naGUSqpLiQuhZzhJY2J7nBwxujHmA@mail.gmail.com>
Subject: Re: [RFC PATCH linux 0/9] On-Chip Controller (OCC) hwmon driver
To: Andrew Jeffery <andrew@aj.id.au>
Cc: Edward James <eajames@us.ibm.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, eajames.ibm@gmail.com
Content-Type: multipart/alternative; boundary=94eb2c19242a3399a00540ff96dd
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
X-List-Received-Date: Fri, 11 Nov 2016 05:16:07 -0000

--94eb2c19242a3399a00540ff96dd
Content-Type: text/plain; charset=UTF-8

On 11 Nov 2016 14:43, "Andrew Jeffery" <andrew@aj.id.au> wrote:
> So I have reworked them into what is now 8 patches (see below) and tried
to
> tell a bit more of a story with them (hopefully I succeeded!) Second, I
tried
> my hand at reworking the layering as mentioned above, such that hardware
> interaction is split from sysfs, and that the SCOM transport and sensor
> configuration is decoupled from the data parsing. You largely had all of
these
> in-place already, I just cut and pasted code around a bit.

Did you look at Jeremy and Chris B's FSI patches? I think you would be the
first client of their new interfaces.

> Please review the patches and provide feedback! I'd like to hear
arguments for
> or against both of our approaches. Note though that I've only tested that
these
> patches compile, I absolutely have not done any further testing.
>
> Joel: Any chance you could chime in with an architectural review?

No worries.

> When the dust has settled on the bigger issues we can start to look at the
> finer details of the APIs (there are some bugs, oddities and complexities
that
> I would like to address before they are applied to openbmc/linux).

I suggest the next step is upstream review. We can put them in the tree if
it's urgent, but I trust that you and Eddie will beat them into shape in no
time. If you succeed we can then apply the upstream versions directly.

Cheers,

Joel

--94eb2c19242a3399a00540ff96dd
Content-Type: text/html; charset=UTF-8

<p dir="ltr"></p>
<p dir="ltr">On 11 Nov 2016 14:43, &quot;Andrew Jeffery&quot; &lt;<a href="mailto:andrew@aj.id.au">andrew@aj.id.au</a>&gt; wrote:<br>
&gt; So I have reworked them into what is now 8 patches (see below) and tried to<br>
&gt; tell a bit more of a story with them (hopefully I succeeded!) Second, I tried<br>
&gt; my hand at reworking the layering as mentioned above, such that hardware<br>
&gt; interaction is split from sysfs, and that the SCOM transport and sensor<br>
&gt; configuration is decoupled from the data parsing. You largely had all of these<br>
&gt; in-place already, I just cut and pasted code around a bit.</p>
<p dir="ltr">Did you look at Jeremy and Chris B&#39;s FSI patches? I think you would be the first client of their new interfaces.</p>
<p dir="ltr">&gt; Please review the patches and provide feedback! I&#39;d like to hear arguments for<br>
&gt; or against both of our approaches. Note though that I&#39;ve only tested that these<br>
&gt; patches compile, I absolutely have not done any further testing.<br>
&gt;<br>
&gt; Joel: Any chance you could chime in with an architectural review?</p>
<p dir="ltr">No worries. </p>
<p dir="ltr">&gt; When the dust has settled on the bigger issues we can start to look at the<br>
&gt; finer details of the APIs (there are some bugs, oddities and complexities that<br>
&gt; I would like to address before they are applied to openbmc/linux).</p>
<p dir="ltr">I suggest the next step is upstream review. We can put them in the tree if it&#39;s urgent, but I trust that you and Eddie will beat them into shape in no time. If you succeed we can then apply the upstream versions directly.</p>
<p dir="ltr">Cheers,</p>
<p dir="ltr">Joel</p>

--94eb2c19242a3399a00540ff96dd--
