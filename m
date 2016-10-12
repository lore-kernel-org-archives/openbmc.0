Return-Path: <joel.stan@gmail.com>
Received: from mail-vk0-x22f.google.com (mail-vk0-x22f.google.com
 [IPv6:2607:f8b0:400c:c05::22f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sv2fG5WRmzDsxG
 for <openbmc@lists.ozlabs.org>; Wed, 12 Oct 2016 16:36:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=LfcIayT0; 
 dkim-atps=neutral
Received: by mail-vk0-x22f.google.com with SMTP id 192so40390779vkl.2
 for <openbmc@lists.ozlabs.org>; Tue, 11 Oct 2016 22:36:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=NXUk5NEVFJCSRLrcyuidQ6zoX34ndIvUma1bemRK66g=;
 b=LfcIayT0K9tnaq8CfPpI7c6EAaG7HEU4UCy2bktptOaV3Cuwv1yA+UL+ImM3JrZbaJ
 UAoGLJelzT1EvmSFjB3RCX5zHF5/eHT6q/fPXI3RetyWbIJQKMAuycVS+F8VA5bBsmpc
 Uu1RjEdZVKh5wfsUwMZy6Q1O9JtXMdr3UOWavSwfTtIDZvv3Ip0eue+gzLDv5ZsdLjPf
 Jn9B232+eeeQnZCDY7QhYGfL2kop++tnaPBT0pSJvaOGeDM4c/b5eRZ5d1BqssZARmCO
 mBRs6+LXztKEfV+adVX+Tbt88OUEA9kBe2yXDddtGUPSKLF/VqBuO09fyvdCarswaHiV
 S9fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=NXUk5NEVFJCSRLrcyuidQ6zoX34ndIvUma1bemRK66g=;
 b=G8eSjB0aMQC8s3fZztz1p8cftZknoHARUefoVC8ABR6WgI0SfRbEKt89832wfnXXT8
 YhygBkB9nRiJxX1aDkK+j/3Yr+QMsSIEIdqHEUSOia/wvAX+9P8zgViagcMfpBpet2KO
 nQbPcgo/BmKmzQf96KOX5RBuRTnSHZgBPbW5AXE0NyEwnKBs40ecSILOJh02aMt+pL+8
 chStFXxUW6UzXnCXOanhsoPSr7BNkJrdDTyhXh8KmjVXRMR16Pl303jdcpaMf7gtrVZz
 mZJ5TfcxHUmIJzbhce60vE/CdzQOpCkOdhVA6nOfZyYuCAQNAsaUAJHU5hBP/ydPZFlJ
 mU/A==
X-Gm-Message-State: AA6/9RldTF3ioTzzVDK2TrvKKL8zzSZH49lXzxTWS4agu3hV54Fii0VXIamc9yJwXNe0ajgAzrmhZJOFLwIh0Q==
X-Received: by 10.31.115.8 with SMTP id o8mr6000739vkc.2.1476250580706; Tue,
 11 Oct 2016 22:36:20 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.176.7.8 with HTTP; Tue, 11 Oct 2016 22:36:00 -0700 (PDT)
In-Reply-To: <CACPK8XeB1cFLJQesU2ELhX=F7Nuqx8vxXsVuL+jxvOLJdvridg@mail.gmail.com>
References: <CACPK8XfQPDg0H_aNKmZOje7pPDRE9sJsD-epqAB8uW2X6SrrDg@mail.gmail.com>
 <CALLMt=rbR1usfKPt9G8kdUa2RaqRaaVEG3rV62wSBjaM59qi6Q@mail.gmail.com>
 <CACPK8Xcn=s3NAnVNOYBXwHrnfYPT7xicH-TTXTb50TJU6OHHrA@mail.gmail.com>
 <20160930013816.GC7390@heinlein.lan>
 <CACPK8Xd3vP0E14-QSnpKxcLYdnaf=eqZb3hvfm26QCEZCA3aiA@mail.gmail.com>
 <20160930131252.GD7390@heinlein.lan>
 <CALLMt=o-pdSefwGK9rSyoW1+6UzMspzkvQmSnZJrz9h3G89W5w@mail.gmail.com>
 <1476143058.16733.10.camel@aj.id.au> <20161011013601.GA19444@distroguy.com>
 <CALLMt=rTC2rgPc-_rkdVwN=o688AsKg7WvefEBrSZE48GMzRqA@mail.gmail.com>
 <20161011020029.GB19444@distroguy.com>
 <CALLMt=r6FqtAfbGwPH=9TeCq4tsJ9FKFr1g9xA8mP7KKRh36ew@mail.gmail.com>
 <CACPK8XcFhtDn121B2r6Wv_E8FHWSTw9JFXvpVAt4fkdq3p8+aA@mail.gmail.com>
 <CACPK8XeB1cFLJQesU2ELhX=F7Nuqx8vxXsVuL+jxvOLJdvridg@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 12 Oct 2016 16:36:00 +1100
X-Google-Sender-Auth: b91-miMG7sJSgoiuJAO4nxX6c5Y
Message-ID: <CACPK8XeNz44e4yMCvKxAGEO+z51FkgDdgvzzVpBKZusCt27epw@mail.gmail.com>
Subject: Re: openpower.xyz updates
To: Andrew Geissler <geissonator@gmail.com>
Cc: Chris Smart <chris@distroguy.com>, Andrew Jeffery <andrew@aj.id.au>, 
 Patrick Williams <patrick@stwcx.xyz>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Wed, 12 Oct 2016 05:36:23 -0000

On Tue, Oct 11, 2016 at 5:23 PM, Joel Stanley <joel@jms.id.au> wrote:
> On Tue, Oct 11, 2016 at 1:12 PM, Joel Stanley <joel@jms.id.au> wrote:
> Andrew G, I took a look at the Gerrit plugin between 2.21.1 and 2.22.
>
> https://github.com/jenkinsci/gerrit-trigger-plugin/compare/gerrit-trigger-2.21.1...gerrit-trigger-2.22.0
>
> https://issues.jenkins-ci.org/browse/JENKINS-35379
>
> Perhaps we could try bisecting the changes made to the plugin to work
> out what went wrong?

Overnight we upgraded to the latest LTS release of Jenkins to see if
that fixed our issue. It did not.

I then tried to downgrade the plugins, but this caused our
github-oauth plugin to downgrade (I think the new Jenkins release
tries to downgrade dependencies when downgrading a plugin). This broke
login, which relies on oauth. I tried to re-upgrade the plugin, but it
was still broken - an exception was thrown as the plugin was unable to
parse the oauth config file. For reference, the signatures looked like
this:

Caused by: java.lang.ClassCastException:
org.acegisecurity.providers.anonymous.AnonymousAuthenticationToken
cannot be cast to org.jenkinsci.plugins.GithubAuthenticationToken

com.google.common.util.concurrent.UncheckedExecutionException:
java.lang.ClassCastException:
org.acegisecurity.providers.anonymous.AnonymousAuthenticationToken
cannot be cast to org.jenkinsci.plugins.GithubAuthenticationToken

We tried removing the config file, modifying it, restoring from
backup, to no avail.

To our luck, the github-oauth plugin was updated over night. The new
release Just Worked so we ran with that.

Back to the core issue of the Gerrit - Jenkins failure to kick of
build jobs. I found out more about the design of the Gerrit - Jenkins
system today.

We have a Gerrit Trigger plugin that listens to the event stream from
Gerrit over ssh. When it sees a new patch it runs a job that checks
the submitter against a list of whitelisted users (those in the
OpenBMC team on Github). If the user is approved, it updates the
commit with the ok-to-test label.

Another job uses the Trigger plugin to look for the ok-to-test label.
When it sees this label in the stream, it kicks off a build job. The
reason Andrew separates out the two is so an admin can manually tick
the ok-to-test box allowing drive by contributions to be tested.

The bug is due to the newer version of the plugin not seeing these
events. We're not sure why that happens, but put a workaround in place
that causes the jobs to still trigger while we sort it out.

Cheers,

Joel
