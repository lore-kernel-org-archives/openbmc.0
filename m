Return-Path: <cyrilbur@gmail.com>
Received: from mail-pa0-x242.google.com (mail-pa0-x242.google.com
 [IPv6:2607:f8b0:400e:c03::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rDPBD3FnXzDqDQ
 for <openbmc@lists.ozlabs.org>; Tue, 24 May 2016 15:30:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=R9jjKHP3; 
 dkim-atps=neutral
Received: by mail-pa0-x242.google.com with SMTP id fg1so904793pad.3
 for <openbmc@lists.ozlabs.org>; Mon, 23 May 2016 22:30:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=date:from:to:subject:message-id:mime-version
 :content-transfer-encoding;
 bh=IjJG+8vT6BFaysUTKWfRD00cw70GC7nsUEHsXaCZGRQ=;
 b=R9jjKHP3ZpQaBahYBRJegAGyVTUkxU8yMt7PbubY56NE8RuBAQ1OIWF+m3bdmqhUA7
 xbuZbZmAvrNbh2I+Mruu/ODRKZEkbxKmQaN70uGbXUGlMVmagqmfJM2nG0b76CtPAv4s
 wjIAPhs2SvOyXqeYe5tZhcbX98BG9ANaU+HYpJIb3YPWgW1tls1N+A/xQmqfu76cmJJ1
 +zMJgPkCvc3q2ktxl03m2UkdsM7lV1AW/T+TvsaESoMrW/fC3VfqgAOLohSQkqJwgGXF
 fNIOD82DVFbXiiQ7ON0U8ckdJPev3fFHZ14jtT1cejxyElP4S5Px+hG/So3vIfsaihGk
 ggPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:date:from:to:subject:message-id:mime-version
 :content-transfer-encoding;
 bh=IjJG+8vT6BFaysUTKWfRD00cw70GC7nsUEHsXaCZGRQ=;
 b=WovzcFk99fZIFunMVqxfbiI4FjEUSKjxs0Qa8pSASzuJ6+XPpaS07gs7HDhkQUthqV
 DqCUHpJgYnitV9lHOzIuIKeRe69DYzjCCWEXC6r7MzcRDybZRWpq0xOhBDs5v3dToRI9
 tHqCKKYWw/pbqCG19BtRHKNFbjs3nf8YppyVcBYi4XY6yQdHQBEb6advfHAJoa43Etvc
 fXJMm25RDOyys1PPIyj6WO69kpmEWLYP9/0VIX/qgdSnmVdMiJaPYNwT1lvgpDBFxBuE
 l5wJ0BXA7GgfmPZIRp+H3mgRbCy8pNu/v70dq92m5WiAcDikJIundvXUJrhYhncIG+D1
 Zl/g==
X-Gm-Message-State: ALyK8tJWl4mObiei2TRJZYWENecSZELe3raK2QNCMvuyRjSRr21tzcOkgu0A5iN9yaNQjg==
X-Received: by 10.66.55.101 with SMTP id r5mr3909391pap.146.1464067809216;
 Mon, 23 May 2016 22:30:09 -0700 (PDT)
Received: from camb691 ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id n78sm10222134pfi.79.2016.05.23.22.30.07
 for <openbmc@lists.ozlabs.org> (version=TLSv1/SSLv3 cipher=OTHER);
 Mon, 23 May 2016 22:30:08 -0700 (PDT)
Date: Tue, 24 May 2016 15:30:00 +1000
From: Cyril Bur <cyrilbur@gmail.com>
To: openbmc@lists.ozlabs.org
Subject: Hi contributors!
Message-ID: <20160524153000.0a505092@camb691>
X-Mailer: Claws Mail 3.13.2 (GTK+ 2.24.30; x86_64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 24 May 2016 05:30:13 -0000

Hi All,

I don't know if this has ever been said on this list or if this is even the
best place for it. I have no problems sending to the openbmc wiki or anywhe=
re
else people might find useful. If it has been said before then, well I've
wasted my time.

It has become increasingly visible that many contributors aren't as intimat=
ely
familiar with, for lack of a better term, opensource development.

There are three things I aim to help with here.
Firstly, sending patches that everyone can work with.
Secondly, git, by now everyone should have realised that git is an incredib=
ly
complex and powerful tool, I am probably not the best person to teach the
intricacies of git but I can try to help.
Lastly the mailing list and I am well aware (too much, trust me!) that much=
 of
these problems are outside the control of people here but I'll say it anywa=
y.

Don't forget that Jeremy has written something that everyone should have re=
ad:
https://github.com/openbmc/docs/blob/master/contributing.md. Step 1 for any
project should be reading their equivalent.


---------------------------------------------------------------------------=
--------
Being a good citizen.
Lets us go back to what Jeremy wrote:
https://github.com/openbmc/docs/blob/master/contributing.md contains a very
important link
http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/Documen=
tation/SubmittingPatches
When I said you should read what Jeremy wrote, it was implied that you
should follow links and read those too.

I know that SubmittingPatches is long and you'll be tempted to skim read it=
, so
I'm going to take the time to highlight some parts that I think should be r=
ead
by all contributors to this list.=20

Let us start at point 2 "Describe your changes." Please read the entire sec=
tion,
I'll quote parts here purely for emphasis. "describe what you are actually =
doing
about it in technical detail" and "Solve only one problem per patch." and "=
try
to make your explanation understandable without external resources".

Point 3:
Again, please read the entire thing, this one is short and very relevant.
This was written for the kernel but this applies to any project. We should
ensure openbmc builds and runs property *after each patch*. This is very
important, the best argument is `git bisect`. Having bisectability is a
powerful tool and we want to be able to use that as much as possible. There
have been a lot of series posted to this list where one patch fixes a probl=
em
introduced by a previous patch. There are many ways to solve this using git,
I'll explain in the git section.

By now you should have realised that point 4 is very important. We are
following the kernel style guide so the first sentence is relevant. We do n=
ot
have a checkpatch script, just make sure you do the best you can to check y=
our
style.

I know point 6 overlaps with what I'm going to talk about later but please
please please try to stay plain text!

Do not forget point 11 "Sign your work". Jeremy kindly copied the Developer=
's
Certificate of Origin into the guide and as the kernel docs say
"then you just add a line saying
	Signed-off-by: Random J Developer <random@developer.example.org>
using your real name (sorry, no pseudonyms or anonymous contributions.)"

The real name and trackable email address are important here!

Finally, the first reference is quite good - consider reading it too.
Andrew Morton, "The perfect patch" (tpp).
  <http://www.ozlabs.org/~akpm/stuff/tpp.txt>


---------------------------------------------------------------------------=
--------
Git!
I assume everyone here is at a basic level. I have done some googling and t=
here
are more detailed explanations but this one is concise and to the point.
http://stackoverflow.com/questions/20956154/whats-the-workflow-to-contribut=
e-to-an-open-source-project-using-git-pull-reque
There is one comment on there that you can (and should) ignore:
"Also, it's recommended to squash your commits so that the pull request only
has one big commits =E2=80=93 Heisenberg Jul 22 '15 at 19:28"

Firstly, all contributors should run:
`git config --global user.email "your_email@example.com"`
and
`git config --global user.name "Your full name"`

So for me I've done:
`git config --global user.email "cyrilbur@gmail.com"`
`git config --global user.name "Cyril Bur"`
I've specifically not done anything like set my github username or an email=
 I
don't check or don't contribute from:
`git config --global user.email "email_i_dont_check@example.com"`
or
`git config --global user.name "cyrilbur-ibm"`
Special mention to IBMers, your @yy.ibm.com username as your full name isn't
good enough! Your full name probably has at least one space in it.

I've looked around for some online guides. There are so many on "Create bra=
nch,
commit something, send upstream" but not many "So you realised your stuff is
broken" "a reviewer has made some good points and you need to address them"=
 or
even "Ah help my tree got a bit crazy I need to clean it up" guides.

The frustrating thing with git can be that you want to do something but it =
can
be quite hard to find out how.

Before I give any commands, be careful, "Perfect is the enemy of
good" (sigh English), while you can make your tree much cleaner with these
methods, you can undoubtedly make things much worse.

Let us introduce options to `git commit`, notably '--amend'.
--amend: This allows you to add to the commit to the top of your tree. So if
you just committed something and realise that you forgot a semicolon, --ame=
nd is
your friend.

--amend only allows you to change the top commit, lets say you need to
change a commit further down. `git rebase --interactive` is helpful here.
The most basic use of `git rebase --interactive` is if origin changes while
you're working on your feature.
Assuming you have your feature branch checked out, you can simply do `git
rebase --interactive origin/master` and you'll be presented with this:
pick 4d01a04 Add new interface
pick bbafdd7 Add tests for cool new interface
pick f75f556 Expose new interface to module_x()
pick 60190ca Use new interface in function_a()
pick fcd6a13 Use new interface in function_b()

At this point, if you simply exit your editor, your branch to add new inter=
face
will now be (re)based on upstream, starting with 4d01a04 and applying commi=
ts
DOWN the list. But wait there's more, you'll notice there's help text:
# Commands:
# p, pick =3D use commit
# r, reword =3D use commit, but edit the commit message
# e, edit =3D use commit, but stop for amending
# s, squash =3D use commit, but meld into previous commit
# f, fixup =3D like "squash", but discard this commit's log message
# x, exec =3D run command (the rest of the line) using shell
# d, drop =3D remove commit

So in the above example I could have changed the 'pick' words at the start =
of
each line with one of those commands and done more.
Lets pretend those commits looked more like this:
pick 4d01a04 Add new interface
pick bbafdd7 Add tests for cool new interface
pick f75f556 Fix new interface to pass tests
pick 60190ca Add more tests
pick fcd6a13 Use new interface in function_b()

Now, I don't want to send this series as is. If I do it means that just
applying 4d01a04 leaves the tree in a broken state until f75f556 is applied.
Possibly even worse (but we're just talking levels of bad here), if only 4d=
01a04
and bbafdd7 are applied then tests will fail, that's never good!
Lets use the power of rebase, I can manually edit what is being presented t=
o me
to do:
pick 4d01a04 Add new interface
fixup f75f556 Fix new interface to pass tests
pick bbafdd7 Add tests for cool new interface
fixup 60190ca Add more tests
pick fcd6a13 Use new interface in function_b()

Also notice that I did a fixup of 60190ca into bbafdd7 because it really ma=
kes
no sense to have two patches adding tests for the same interface.

These features a incredibly useful for sending clean and logical series. Do=
n't
forget about reword, it is critical to ensure commit messages are as clear =
and
as descriptive as possible.

It might be wise to say that a rebase might have conflicts, in which case g=
it
will stop the rebase when it detects a conflict and ask you what to to do. =
It
will put you at the point where it detects on the conflict with both
possibilities in the file where the problem is. You can run `git diff` to
quickly see what's going on and start fixing the problem. Git gives you
some tips on what to do, just know that at this point `git rebase --abort` =
is
perfectly safe and will put you back where you were at before you started t=
he
rebase.

One final note with rebase, git won't let you do it if you have uncommitted
changes in your tree, but that's ok, fixing up the tree is probably the last
thing you want to do so that shouldn't be a problem.

This isn't the optimal way of dealing with these problems and most likely n=
ot
the only way, but it is a way which works. If you want to dive more into gi=
t,
I'll let you understand what the options '--fixup' and '--squash' to `git
commit` do.

Like all the git tutorials out there, this example is fake and not real wor=
ld,
mostly because no one ever just works on one aspect of a project without
simultaneously working on some other part. That means that having a clean
tree can be a challenge. Historically there is a rather adhoc way of dealing
with this problem. I won't mention that here because I'm pretty sure no one=
 has
ever used stashes without making a mess.

Somewhat recently git introduced 'worktree's, this is a decent explanation =
of
what it does:
https://developer.atlassian.com/blog/2015/10/cool-features-git-2.x/ have a
read, it will make your life easier.


---------------------------------------------------------------------------=
--------
The mailing list...
I'm going to outline problems as I see them, I know that it may prove
impossible to fix some or all of them and that's ok but I would encourage a=
nyone
to apply pressure to those who can fix the problems for you because not bei=
ng
able to send:
a) Plaintext
b) Whitespace correct
c) Correct headers
d) Standards compliant
email in 2016 is a little embarrassing. In most cases we're embarrassed for=
 you
but not at you. If it is at all possible, setup a gmail account, use `git
format-patch` and/or `git send-email` for patches and participate on the li=
st
through gmail. I'm happy to provide howto links, just ask (this is getting =
a bit
long that's all).

I will admit that github pull requests have been a good attempt at trying to
solve these problems but has quite a few side problems. It creates a lot of
spam. I know I've been guilty of this (although I don't know how) but it po=
sts
new versions of series really easily, all I can say here is be careful.

Perhaps we should start a system of responding to superseded versions.
Maintainers could respond to indicate that they have merged or closed reque=
sts.
I have often found myself reviewing code which has been merged. Doing so is=
n't
useless but had I known, probably would have spent my time reviewing unmerg=
ed
code.

There can often be 5+ versions with no replies which has left me wondering =
if
I'm looking at the most recent version, also, these versions sometimes aren=
't
different (github I know), could we start a habit of better tracking (almost
ironically with more emails) to help people reviewing know where their time=
 is
best spent. If your series gets multi posted, please indicate in the older
versions that they can be ignored.

On reviewing: we should all be participating and once again, in plain text =
and
inline responses. Please don't ignore comments, address everything, respond=
 to
the viewer and let them know what you think of their comments. Usually post=
ing
the next version involves sending more emails and normally a cover letter w=
ould
be used to indicate the changes. With the github pull requests, I'm *told*,=
 you
can edit the first comment of the pull request and it comes up in the cover
letter of the subsequent version. PLEASE DO THIS! It makes life so much eas=
ier
for everyone when a v2 says how it is different from v1.

On cover letters: they aren't mandatory or anything but there are a lot of =
pull
requests that appear on the list as bunch of patches that are already lacki=
ng
in the commit message quality so the lack of cover letter is not helping. A
great tip I can give here for cover letters and commit messages is assume
you're talking a new member of your team who hasn't seen the code before bu=
t is
expected to understand it soon. You need to describe the problem and how yo=
u've
gone about fixing it.

Finally, this is more of a request to the admins. Is it possible to fix
the list so that the 'Reply to all' button works like it does on other list=
s?
If I go to linuxppc-dev and click 'Reply to all' to review a patch I get "T=
o:
Patch Author" and "Cc: Everyone orignally CCed and the list".
If I do that on a patch on openbmc it is 'To: "OpenBMC Patches
<openbmc-patches@stwcx.xyz>"' (because it was originally from that address)=
 and
sometimes the author isn't on Cc and other times the list isn't on Cc.

I won't drag out the ending, thanks so much for reading this! Send me an em=
ail
if you've got any questions! I'll endeavour to put a cut down version of so=
me of
this in the docs repo and maybe put an (expanded) git help up online in a m=
ore
permanent place.

Sincerely,

Cyril
