Return-Path: <dja@axtens.net>
Received: from mail-pa0-x230.google.com (mail-pa0-x230.google.com
 [IPv6:2607:f8b0:400e:c03::230])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 380861A0175
 for <openbmc@lists.ozlabs.org>; Fri,  5 Feb 2016 09:06:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.b=Cltm/LvG; 
 dkim-atps=neutral
Received: by mail-pa0-x230.google.com with SMTP id yy13so22174338pab.3
 for <openbmc@lists.ozlabs.org>; Thu, 04 Feb 2016 14:06:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:in-reply-to:references:user-agent:date
 :message-id:mime-version:content-type;
 bh=HLDHe3ORDDRkph6rez29THYrkyXNpjNSYUKRG3LYz3I=;
 b=Cltm/LvG5rmPHQaMYhHclnG1zOfA4EId5PsEJd2lPbwG0WNQ3ZgXQQBFs7al96yDLl
 VqckFKnRHn9CLIdxJnPQIRCNn3LmJgtLZmNadyyI2UnD6w1rgBD83XYbxvFdEAM+NEDO
 KrkYd15jG0ZSHqPsBDOHqhWKsCcW058hp7uI8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:date:message-id:mime-version:content-type;
 bh=HLDHe3ORDDRkph6rez29THYrkyXNpjNSYUKRG3LYz3I=;
 b=StejQ/IyeSfHeSzTSRXZF27WdrYve9x013noTgZ+kVP5BPj5w9iWPHpoHknKarh8Fv
 Xya1lTU/HdQ+uWJXiuLWqppQaJlVMRyGiTMRfOH9fTPYEgvEQy2ZLYtsIjLcwxtz7svf
 1I1f/9E1vhMVb3EAO+k/BtsV9Bdnzuau6oMkP1vpSEL/ChEG/0ocYjVa6aerY8xgyhJi
 o4w2E+qS3T+3QBp4HWWaihKspIpx64A5FKqaQYO1ROchFcvZrq7kScBO/zQgq8Xnnh3K
 mtgEBsfDdvWFiggFFk/J8TscfPVfUP13bpcd/3i6PeVk25yWFITRfWWza++IP2aWIfbw
 40WA==
X-Gm-Message-State: AG10YOSc3FShCmx5HLTQkfFQnXXYI+FhorKTVz1fB+KIRJSuuCJP4qHL+7rxb6asLFDVjA==
X-Received: by 10.66.140.44 with SMTP id rd12mr14634037pab.86.1454623606078;
 Thu, 04 Feb 2016 14:06:46 -0800 (PST)
Received: from localhost ([138.44.250.25])
 by smtp.gmail.com with ESMTPSA id k65sm16904128pfb.30.2016.02.04.14.06.44
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 04 Feb 2016 14:06:45 -0800 (PST)
From: Daniel Axtens <dja@axtens.net>
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>, openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@us.ibm.com>
Subject: Re: [PATCH phosphor-objmgr 2/2] Run phosphor-mapper through pep8
In-Reply-To: <1454619032-21755-3-git-send-email-openbmc-patches@stwcx.xyz>
References: <1454619032-21755-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1454619032-21755-3-git-send-email-openbmc-patches@stwcx.xyz>
User-Agent: Notmuch/0.21 (http://notmuchmail.org) Emacs/24.5.1
 (x86_64-pc-linux-gnu)
Date: Fri, 05 Feb 2016 09:06:40 +1100
Message-ID: <87zivgdtan.fsf@gamma.ozlabs.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.20
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 04 Feb 2016 22:06:50 -0000

OpenBMC Patches <openbmc-patches@stwcx.xyz> writes:

Thank you for doing this in a separate patch, and for using pep8 :)
Awesome.

Regards,
Daniel

> From: Brad Bishop <bradleyb@us.ibm.com>
>
> This is all whitespace adjustments flagged by pep8.
> ---
>  OpenBMCMapper.py | 613 ++++++++++++++++++++++++++++---------------------------
>  phosphor-mapper  | 335 +++++++++++++++---------------
>  setup.cfg        |   2 +-
>  3 files changed, 486 insertions(+), 464 deletions(-)
>
> diff --git a/OpenBMCMapper.py b/OpenBMCMapper.py
> index 2ed65f7..518e703 100644
> --- a/OpenBMCMapper.py
> +++ b/OpenBMCMapper.py
> @@ -25,331 +25,340 @@ MAPPER_PATH = '/org/openbmc/objectmapper/objectmapper'
>  ENUMERATE_IFACE = 'org.openbmc.Object.Enumerate'
>  MAPPER_NOT_FOUND = 'org.openbmc.objectmapper.Error.NotFound'
>  
> +
>  class Path:
> -	def __init__(self, path):
> -		self.parts = filter(bool, path.split('/'))
> +    def __init__(self, path):
> +        self.parts = filter(bool, path.split('/'))
> +
> +    def rel(self, first=None, last=None):
> +        # relative
> +        return self.get('', first, last)
>  
> -	def rel(self, first = None, last = None):
> -		# relative
> -		return self.get('', first, last)
> +    def fq(self, first=None, last=None):
> +        # fully qualified
> +        return self.get('/', first, last)
>  
> -	def fq(self, first = None, last = None):
> -		# fully qualified
> -		return self.get('/', first, last)
> +    def depth(self):
> +        return len(self.parts)
>  
> -	def depth(self):
> -		return len(self.parts)
> +    def get(self, prefix='/', first=None, last=None):
> +        if not first:
> +            first = 0
> +        if not last:
> +            last = self.depth()
> +        return prefix + '/'.join(self.parts[first:last])
>  
> -	def get(self, prefix = '/', first = None, last = None):
> -		if not first:
> -			first = 0
> -		if not last:
> -			last = self.depth()
> -		return prefix + '/'.join(self.parts[first:last])
>  
>  def org_dot_openbmc_match(name):
> -	return 'org.openbmc' in name
> +    return 'org.openbmc' in name
> +
>  
>  class ListMatch(object):
> -	def __init__(self, l):
> -		self.l = l
> +    def __init__(self, l):
> +        self.l = l
> +
> +    def __call__(self, match):
> +        return match in self.l
>  
> -	def __call__(self, match):
> -		return match in self.l
>  
>  class IntrospectionNodeParser:
> -	def __init__(self, data, tag_match = bool, intf_match = bool):
> -		self.data = data
> -		self.cache = {}
> -		self.tag_match = tag_match
> -		self.intf_match = intf_match
> -
> -	def parse_args(self):
> -		return [ x.attrib for x in self.data.findall('arg') ]
> -
> -	def parse_children(self):
> -		return [ x.attrib['name'] for x in self.data.findall('node') ]
> -
> -	def parse_method_or_signal(self):
> -		name = self.data.attrib['name']
> -		return name, self.parse_args()
> -
> -	def parse_interface(self):
> -		iface = {}
> -		iface['method'] = {}
> -		iface['signal'] = {}
> -
> -		for node in self.data:
> -			if node.tag not in ['method', 'signal']:
> -				continue
> -			if not self.tag_match(node.tag):
> -				continue
> -			p = IntrospectionNodeParser(
> -					node, self.tag_match, self.intf_match)
> -			n, element = p.parse_method_or_signal()
> -			iface[node.tag][n] = element
> -
> -		return iface
> -
> -	def parse_node(self):
> -		if self.cache:
> -			return self.cache
> -
> -		self.cache['interfaces'] = {}
> -		self.cache['children'] = []
> -
> -		for node in self.data:
> -			if node.tag == 'interface':
> -				p = IntrospectionNodeParser(
> -						node, self.tag_match, self.intf_match)
> -				name = p.data.attrib['name']
> -				if not self.intf_match(name):
> -					continue
> -				self.cache['interfaces'][name] = p.parse_interface()
> -			elif node.tag == 'node':
> -				self.cache['children'] = self.parse_children()
> -
> -		return self.cache
> -
> -	def get_interfaces(self):
> -		return self.parse_node()['interfaces']
> -
> -	def get_children(self):
> -		return self.parse_node()['children']
> -
> -	def recursive_binding(self):
> -		return any('/' in s for s in self.get_children())
> +    def __init__(self, data, tag_match=bool, intf_match=bool):
> +        self.data = data
> +        self.cache = {}
> +        self.tag_match = tag_match
> +        self.intf_match = intf_match
> +
> +    def parse_args(self):
> +        return [x.attrib for x in self.data.findall('arg')]
> +
> +    def parse_children(self):
> +        return [x.attrib['name'] for x in self.data.findall('node')]
> +
> +    def parse_method_or_signal(self):
> +        name = self.data.attrib['name']
> +        return name, self.parse_args()
> +
> +    def parse_interface(self):
> +        iface = {}
> +        iface['method'] = {}
> +        iface['signal'] = {}
> +
> +        for node in self.data:
> +            if node.tag not in ['method', 'signal']:
> +                continue
> +            if not self.tag_match(node.tag):
> +                continue
> +            p = IntrospectionNodeParser(
> +                node, self.tag_match, self.intf_match)
> +            n, element = p.parse_method_or_signal()
> +            iface[node.tag][n] = element
> +
> +        return iface
> +
> +    def parse_node(self):
> +        if self.cache:
> +            return self.cache
> +
> +        self.cache['interfaces'] = {}
> +        self.cache['children'] = []
> +
> +        for node in self.data:
> +            if node.tag == 'interface':
> +                p = IntrospectionNodeParser(
> +                    node, self.tag_match, self.intf_match)
> +                name = p.data.attrib['name']
> +                if not self.intf_match(name):
> +                    continue
> +                self.cache['interfaces'][name] = p.parse_interface()
> +            elif node.tag == 'node':
> +                self.cache['children'] = self.parse_children()
> +
> +        return self.cache
> +
> +    def get_interfaces(self):
> +        return self.parse_node()['interfaces']
> +
> +    def get_children(self):
> +        return self.parse_node()['children']
> +
> +    def recursive_binding(self):
> +        return any('/' in s for s in self.get_children())
> +
>  
>  class IntrospectionParser:
> -	def __init__(self, name, bus, tag_match = bool, intf_match = bool):
> -		self.name = name
> -		self.bus = bus
> -		self.tag_match = tag_match
> -		self.intf_match = intf_match
> -
> -	def _introspect(self, path):
> -		try:
> -			obj = self.bus.get_object(self.name, path, introspect = False)
> -			iface = dbus.Interface(obj, dbus.INTROSPECTABLE_IFACE)
> -			data = iface.Introspect()
> -		except dbus.DBusException:
> -			return None
> -
> -		return IntrospectionNodeParser(
> -				ElementTree.fromstring(data),
> -				self.tag_match,
> -				self.intf_match)
> -
> -	def _discover_flat(self, path, parser):
> -		items = {}
> -		interfaces = parser.get_interfaces().keys()
> -		if interfaces:
> -			items[path] = {}
> -			items[path]['interfaces'] = interfaces
> -
> -		return items
> -
> -	def introspect(self, path = '/', parser = None):
> -		items = {}
> -		if not parser:
> -			parser = self._introspect(path)
> -		if not parser:
> -			return {}
> -		items.update(self._discover_flat(path, parser))
> -
> -		if path != '/':
> -			path += '/'
> -
> -		if parser.recursive_binding():
> -			callback = self._discover_flat
> -		else:
> -			callback = self.introspect
> -
> -		for k in parser.get_children():
> -			parser = self._introspect(path + k)
> -			if not parser:
> -				continue
> -			items.update(callback(path + k, parser))
> -
> -		return items
> +    def __init__(self, name, bus, tag_match=bool, intf_match=bool):
> +        self.name = name
> +        self.bus = bus
> +        self.tag_match = tag_match
> +        self.intf_match = intf_match
> +
> +    def _introspect(self, path):
> +        try:
> +            obj = self.bus.get_object(self.name, path, introspect=False)
> +            iface = dbus.Interface(obj, dbus.INTROSPECTABLE_IFACE)
> +            data = iface.Introspect()
> +        except dbus.DBusException:
> +            return None
> +
> +        return IntrospectionNodeParser(
> +            ElementTree.fromstring(data),
> +            self.tag_match,
> +            self.intf_match)
> +
> +    def _discover_flat(self, path, parser):
> +        items = {}
> +        interfaces = parser.get_interfaces().keys()
> +        if interfaces:
> +            items[path] = {}
> +            items[path]['interfaces'] = interfaces
> +
> +        return items
> +
> +    def introspect(self, path='/', parser=None):
> +        items = {}
> +        if not parser:
> +            parser = self._introspect(path)
> +        if not parser:
> +            return {}
> +        items.update(self._discover_flat(path, parser))
> +
> +        if path != '/':
> +            path += '/'
> +
> +        if parser.recursive_binding():
> +            callback = self._discover_flat
> +        else:
> +            callback = self.introspect
> +
> +        for k in parser.get_children():
> +            parser = self._introspect(path + k)
> +            if not parser:
> +                continue
> +            items.update(callback(path + k, parser))
> +
> +        return items
> +
>  
>  class PathTreeItemIterator(object):
> -	def __init__(self, path_tree, subtree, depth):
> -		self.path_tree = path_tree
> -		self.path = []
> -		self.itlist = []
> -		self.subtree = ['/'] + filter(bool, subtree.split('/'))
> -		self.depth = depth
> -		d = path_tree.root
> -		for k in self.subtree:
> -			try:
> -				d = d[k]['children']
> -			except KeyError:
> -				raise KeyError(subtree)
> -		self.it = d.iteritems()
> -
> -	def __iter__(self):
> -		return self
> -
> -	def __next__(self):
> -		return super(PathTreeItemIterator, self).next()
> -
> -	def next(self):
> -		key, value = self._next()
> -		path = self.subtree[0] + '/'.join(self.subtree[1:] + self.path)
> -		return path, value.get('data')
> -
> -	def _next(self):
> -		try:
> -			while True:
> -				x = self.it.next()
> -				depth_exceeded = len(self.path) +1 > self.depth
> -				if self.depth and depth_exceeded:
> -					continue
> -				self.itlist.append(self.it)
> -				self.path.append(x[0])
> -				self.it = x[1]['children'].iteritems()
> -				break;
> -
> -		except StopIteration:
> -			if not self.itlist:
> -				raise StopIteration
> -
> -			self.it = self.itlist.pop()
> -			self.path.pop()
> -			x = self._next()
> -		
> -		return x
> +    def __init__(self, path_tree, subtree, depth):
> +        self.path_tree = path_tree
> +        self.path = []
> +        self.itlist = []
> +        self.subtree = ['/'] + filter(bool, subtree.split('/'))
> +        self.depth = depth
> +        d = path_tree.root
> +        for k in self.subtree:
> +            try:
> +                d = d[k]['children']
> +            except KeyError:
> +                raise KeyError(subtree)
> +        self.it = d.iteritems()
> +
> +    def __iter__(self):
> +        return self
> +
> +    def __next__(self):
> +        return super(PathTreeItemIterator, self).next()
> +
> +    def next(self):
> +        key, value = self._next()
> +        path = self.subtree[0] + '/'.join(self.subtree[1:] + self.path)
> +        return path, value.get('data')
> +
> +    def _next(self):
> +        try:
> +            while True:
> +                x = self.it.next()
> +                depth_exceeded = len(self.path) + 1 > self.depth
> +                if self.depth and depth_exceeded:
> +                    continue
> +                self.itlist.append(self.it)
> +                self.path.append(x[0])
> +                self.it = x[1]['children'].iteritems()
> +                break
> +
> +        except StopIteration:
> +            if not self.itlist:
> +                raise StopIteration
> +
> +            self.it = self.itlist.pop()
> +            self.path.pop()
> +            x = self._next()
> +
> +        return x
> +
>  
>  class PathTreeKeyIterator(PathTreeItemIterator):
> -	def __init__(self, path_tree, subtree, depth):
> -		super(PathTreeKeyIterator, self).__init__(path_tree, subtree, depth)
> +    def __init__(self, path_tree, subtree, depth):
> +        super(PathTreeKeyIterator, self).__init__(path_tree, subtree, depth)
> +
> +    def next(self):
> +        return super(PathTreeKeyIterator, self).next()[0]
>  
> -	def next(self):
> -		return super(PathTreeKeyIterator, self).next()[0]
>  
>  class PathTree:
> -	def __init__(self):
> -		self.root = {}
> -
> -	def _try_delete_parent(self, elements):
> -		if len(elements) == 1:
> -			return False
> -
> -		kids = 'children'
> -		elements.pop()
> -		d = self.root
> -		for k in elements[:-1]:
> -			d = d[k][kids]
> -
> -		if 'data' not in d[elements[-1]] and not d[elements[-1]][kids]:
> -			del d[elements[-1]]
> -			self._try_delete_parent(elements)
> -
> -	def _get_node(self, key):
> -		kids = 'children'
> -		elements = ['/'] + filter(bool, key.split('/'))
> -		d = self.root
> -		for k in elements[:-1]:
> -			try:
> -				d = d[k][kids]
> -			except KeyError:
> -				raise KeyError(key)
> -		
> -		return d[elements[-1]]
> -
> -	def __iter__(self):
> -		return self
> -
> -	def __missing__(self, key):
> -		for x in self.iterkeys():
> -			if key == x:
> -				return False
> -		return True
> -
> -	def __delitem__(self, key):
> -		kids = 'children'
> -		elements = ['/'] + filter(bool, key.split('/'))
> -		d = self.root
> -		for k in elements[:-1]:
> -			try:
> -				d = d[k][kids]
> -			except KeyError:
> -				raise KeyError(key)
> -
> -		del d[elements[-1]]
> -		self._try_delete_parent(elements)
> -
> -	def __setitem__(self, key, value):
> -		kids = 'children'
> -		elements = ['/'] + filter(bool, key.split('/'))
> -		d = self.root
> -		for k in elements[:-1]:
> -			d = d.setdefault(k, {kids: {}})[kids]
> -
> -		children = d.setdefault(elements[-1], {kids: {}})[kids]
> -		d[elements[-1]].update({kids: children, 'data': value})
> -
> -	def __getitem__(self, key):
> -		return self._get_node(key).get('data')
> -
> -	def setdefault(self, key, default):
> -		if not self.get(key):
> -			self.__setitem__(key, default)
> -
> -		return self.__getitem__(key)
> -
> -	def get(self, key, default = None):
> -		try:
> -			x = self.__getitem__(key)
> -		except KeyError:
> -			x = default
> -
> -		return x
> -
> -	def get_children(self, key):
> -		return [ x for x in self._get_node(key)['children'].iterkeys() ]
> -
> -	def demote(self, key):
> -		n = self._get_node(key)
> -		if 'data' in n:
> -			del n['data']
> -
> -	def keys(self, subtree = '/', depth = None):
> -		return [ x for x in self.iterkeys(subtree, depth) ]
> -
> -	def values(self, subtree = '/', depth = None):
> -		return [ x[1] for x in self.iteritems(subtree, depth) ]
> -
> -	def items(self, subtree = '/', depth = None):
> -		return [ x for x in self.iteritems(subtree, depth) ]
> -
> -	def dataitems(self, subtree = '/', depth = None):
> -		return [ x for x in self.iteritems(subtree, depth) \
> -				if x[1] is not None ]
> -
> -	def iterkeys(self, subtree = '/', depth = None):
> -		if not self.root:
> -			return {}.iterkeys()
> -		return PathTreeKeyIterator(self, subtree, depth)
> -
> -	def iteritems(self, subtree = '/', depth = None):
> -		if not self.root:
> -			return {}.iteritems()
> -		return PathTreeItemIterator(self, subtree, depth)
> +    def __init__(self):
> +        self.root = {}
> +
> +    def _try_delete_parent(self, elements):
> +        if len(elements) == 1:
> +            return False
> +
> +        kids = 'children'
> +        elements.pop()
> +        d = self.root
> +        for k in elements[:-1]:
> +            d = d[k][kids]
> +
> +        if 'data' not in d[elements[-1]] and not d[elements[-1]][kids]:
> +            del d[elements[-1]]
> +            self._try_delete_parent(elements)
> +
> +    def _get_node(self, key):
> +        kids = 'children'
> +        elements = ['/'] + filter(bool, key.split('/'))
> +        d = self.root
> +        for k in elements[:-1]:
> +            try:
> +                d = d[k][kids]
> +            except KeyError:
> +                raise KeyError(key)
> +
> +        return d[elements[-1]]
> +
> +    def __iter__(self):
> +        return self
> +
> +    def __missing__(self, key):
> +        for x in self.iterkeys():
> +            if key == x:
> +                return False
> +        return True
> +
> +    def __delitem__(self, key):
> +        kids = 'children'
> +        elements = ['/'] + filter(bool, key.split('/'))
> +        d = self.root
> +        for k in elements[:-1]:
> +            try:
> +                d = d[k][kids]
> +            except KeyError:
> +                raise KeyError(key)
> +
> +        del d[elements[-1]]
> +        self._try_delete_parent(elements)
> +
> +    def __setitem__(self, key, value):
> +        kids = 'children'
> +        elements = ['/'] + filter(bool, key.split('/'))
> +        d = self.root
> +        for k in elements[:-1]:
> +            d = d.setdefault(k, {kids: {}})[kids]
> +
> +        children = d.setdefault(elements[-1], {kids: {}})[kids]
> +        d[elements[-1]].update({kids: children, 'data': value})
> +
> +    def __getitem__(self, key):
> +        return self._get_node(key).get('data')
> +
> +    def setdefault(self, key, default):
> +        if not self.get(key):
> +            self.__setitem__(key, default)
> +
> +        return self.__getitem__(key)
> +
> +    def get(self, key, default=None):
> +        try:
> +            x = self.__getitem__(key)
> +        except KeyError:
> +            x = default
> +
> +        return x
> +
> +    def get_children(self, key):
> +        return [x for x in self._get_node(key)['children'].iterkeys()]
> +
> +    def demote(self, key):
> +        n = self._get_node(key)
> +        if 'data' in n:
> +            del n['data']
> +
> +    def keys(self, subtree='/', depth=None):
> +        return [x for x in self.iterkeys(subtree, depth)]
> +
> +    def values(self, subtree='/', depth=None):
> +        return [x[1] for x in self.iteritems(subtree, depth)]
> +
> +    def items(self, subtree='/', depth=None):
> +        return [x for x in self.iteritems(subtree, depth)]
> +
> +    def dataitems(self, subtree='/', depth=None):
> +        return [x for x in self.iteritems(subtree, depth)
> +                if x[1] is not None]
> +
> +    def iterkeys(self, subtree='/', depth=None):
> +        if not self.root:
> +            return {}.iterkeys()
> +        return PathTreeKeyIterator(self, subtree, depth)
> +
> +    def iteritems(self, subtree='/', depth=None):
> +        if not self.root:
> +            return {}.iteritems()
> +        return PathTreeItemIterator(self, subtree, depth)
> +
>  
>  class Mapper:
> -	def __init__(self, bus):
> -		self.bus = bus
> -		obj = bus.get_object(MAPPER_NAME, MAPPER_PATH, introspect = False)
> -		self.iface = dbus.Interface(
> -				obj, dbus_interface = MAPPER_IFACE)
> +    def __init__(self, bus):
> +        self.bus = bus
> +        obj = bus.get_object(MAPPER_NAME, MAPPER_PATH, introspect=False)
> +        self.iface = dbus.Interface(
> +            obj, dbus_interface=MAPPER_IFACE)
>  
> -	def get_object(self, path):
> -		return self.iface.GetObject(path)
> +    def get_object(self, path):
> +        return self.iface.GetObject(path)
>  
> -	def get_subtree_paths(self, path = '/', depth = 0):
> -		return self.iface.GetSubTreePaths(path, depth)
> +    def get_subtree_paths(self, path='/', depth=0):
> +        return self.iface.GetSubTreePaths(path, depth)
>  
> -	def get_subtree(self, path = '/', depth = 0):
> -		return self.iface.GetSubTree(path, depth)
> +    def get_subtree(self, path='/', depth=0):
> +        return self.iface.GetSubTree(path, depth)
> diff --git a/phosphor-mapper b/phosphor-mapper
> index da4ae63..255897f 100644
> --- a/phosphor-mapper
> +++ b/phosphor-mapper
> @@ -24,175 +24,188 @@ import gobject
>  from OpenBMCMapper import IntrospectionParser, PathTree
>  import OpenBMCMapper
>  
> +
>  class MapperNotFoundException(dbus.exceptions.DBusException):
> -	_dbus_error_name = OpenBMCMapper.MAPPER_NOT_FOUND
> -	def __init__(self, path):
> -		super(MapperNotFoundException, self).__init__(
> -				"path or object not found: %s" %(path))
> +    _dbus_error_name = OpenBMCMapper.MAPPER_NOT_FOUND
> +
> +    def __init__(self, path):
> +        super(MapperNotFoundException, self).__init__(
> +            "path or object not found: %s" % (path))
> +
>  
>  class ObjectMapper(dbus.service.Object):
> -	def __init__(self, bus, path,
> -			name_match = OpenBMCMapper.org_dot_openbmc_match,
> -			intf_match = OpenBMCMapper.org_dot_openbmc_match):
> -		super(ObjectMapper, self).__init__(bus.dbus, path)
> -		self.cache = PathTree()
> -		self.bus = bus
> -		self.name_match = name_match
> -		self.intf_match = intf_match
> -		self.tag_match = OpenBMCMapper.ListMatch(['children', 'interface'])
> -		self.service = None
> -
> -		gobject.idle_add(self.discover)
> -		self.bus.dbus.add_signal_receiver(self.bus_handler,
> -			dbus_interface = dbus.BUS_DAEMON_IFACE,
> -			signal_name = 'NameOwnerChanged')
> -		self.bus.dbus.add_signal_receiver(self.interfaces_added_handler,
> -			dbus_interface = dbus.BUS_DAEMON_IFACE + '.ObjectManager',
> -			signal_name = 'InterfacesAdded',
> -			sender_keyword = 'sender')
> -		self.bus.dbus.add_signal_receiver(self.interfaces_removed_handler,
> -			dbus_interface = dbus.BUS_DAEMON_IFACE + '.ObjectManager',
> -			signal_name = 'InterfacesRemoved',
> -			sender_keyword = 'sender')
> -
> -	def bus_match(self, name):
> -		if name == OpenBMCMapper.MAPPER_NAME:
> -			return False
> -		return self.name_match(name)
> -
> -	def discovery_pending(self):
> -		return not bool(self.service)
> -
> -	def interfaces_added_handler(self, path, iprops, **kw):
> -		name = self.bus.get_owned_name(self.bus_match, kw['sender'])
> -		if self.discovery_pending() or \
> -				not self.bus_match(name):
> -			return
> -
> -		matches = [ x for x in iprops.iterkeys() if self.intf_match(x) ]
> -		self.add_interfaces(path, kw['sender'], matches)
> -
> -	def interfaces_removed_handler(self, path, interfaces, **kw):
> -		name = self.bus.get_owned_name(self.bus_match, kw['sender'])
> -		if self.discovery_pending() or \
> -				not self.bus_match(name):
> -			return
> -		item = self.cache[path]
> -		sender = kw['sender']
> -		for x in interfaces:
> -			if self.intf_match(x):
> -				try:
> -					item[sender].remove(x)
> -				except ValueError:
> -					pass
> -
> -		# remove the owner if there aren't any interfaces left
> -		if not item[sender]:
> -			del item[sender]
> -
> -		# update if interfaces remain
> -		if item:
> -			self.cache[path] = item
> -		# mark for removal if no interfaces remain
> -		elif self.cache.get_children(path):
> -			self.cache.demote(path)
> -		# delete the entire path if everything is gone
> -		else:
> -			del self.cache[path]
> -
> -	def process_new_owner(self, name):
> -		# unique name
> -		return self.discover([ IntrospectionParser(name,
> -			self.bus.dbus, self.tag_match, self.intf_match) ])
> -
> -	def process_old_owner(self, name):
> -		for x,y in self.cache.dataitems():
> -			if name not in y:
> -				continue
> -			del y[name]
> -			if y:
> -				self.cache[x] = y
> -			elif self.cache.get_children(x):
> -				self.cache.demote(x)
> -			else:
> -				del self.cache[x]
> -
> -	def bus_handler(self, service, old, new):
> -		if self.discovery_pending() or \
> -				not self.bus_match(service):
> -			return
> -
> -		if new:
> -			self.process_new_owner(new)
> -		if old:
> -			self.process_old_owner(old)
> -
> -	def add_interfaces(self, path, owner, interfaces):
> -		d = self.cache.setdefault(path, {})
> -		d = d.setdefault(owner, [])
> -		self.cache[path][owner] = list(set(d + interfaces))
> -
> -	def add_items(self, owner, bus_items):
> -		for x,y in bus_items.iteritems():
> -			self.add_interfaces(x, owner, y['interfaces'])
> -
> -	def discover(self, owners = None):
> -		if not owners:
> -			owners = [ IntrospectionParser(x, self.bus.dbus,
> -				self.tag_match, self.intf_match) \
> -						for x in self.bus.get_owner_names(self.bus_match) ]
> -		for o in owners:
> -			self.add_items(o.name, o.introspect())
> -
> -		if self.discovery_pending():
> -			print "ObjectMapper discovery complete..."
> -			self.service = dbus.service.BusName(
> -					OpenBMCMapper.MAPPER_NAME, self.bus.dbus)
> -
> -	@dbus.service.method(OpenBMCMapper.MAPPER_IFACE, 's', 'a{sas}')
> -	def GetObject(self, path):
> -		o = self.cache.get(path)
> -		if not o:
> -			raise MapperNotFoundException(path)
> -		return o
> -
> -	@dbus.service.method(OpenBMCMapper.MAPPER_IFACE, 'si', 'as')
> -	def GetSubTreePaths(self, path, depth):
> -		try:
> -			return self.cache.iterkeys(path, depth)
> -		except KeyError:
> -			raise MapperNotFoundException(path)
> -
> -	@dbus.service.method(OpenBMCMapper.MAPPER_IFACE, 'si', 'a{sa{sas}}')
> -	def GetSubTree(self, path, depth):
> -		try:
> -			return { x:y for x, y in self.cache.dataitems(path, depth) }
> -		except KeyError:
> -			raise MapperNotFoundException(path)
> +    def __init__(self, bus, path,
> +                 name_match=OpenBMCMapper.org_dot_openbmc_match,
> +                 intf_match=OpenBMCMapper.org_dot_openbmc_match):
> +        super(ObjectMapper, self).__init__(bus.dbus, path)
> +        self.cache = PathTree()
> +        self.bus = bus
> +        self.name_match = name_match
> +        self.intf_match = intf_match
> +        self.tag_match = OpenBMCMapper.ListMatch(['children', 'interface'])
> +        self.service = None
> +
> +        gobject.idle_add(self.discover)
> +        self.bus.dbus.add_signal_receiver(
> +            self.bus_handler,
> +            dbus_interface=
> +            dbus.BUS_DAEMON_IFACE,
> +            signal_name='NameOwnerChanged')
> +        self.bus.dbus.add_signal_receiver(
> +            self.interfaces_added_handler,
> +            dbus_interface=
> +            dbus.BUS_DAEMON_IFACE + '.ObjectManager',
> +            signal_name='InterfacesAdded',
> +            sender_keyword='sender')
> +        self.bus.dbus.add_signal_receiver(
> +            self.interfaces_removed_handler,
> +            dbus_interface=dbus.BUS_DAEMON_IFACE + '.ObjectManager',
> +            signal_name='InterfacesRemoved',
> +            sender_keyword='sender')
> +
> +    def bus_match(self, name):
> +        if name == OpenBMCMapper.MAPPER_NAME:
> +            return False
> +        return self.name_match(name)
> +
> +    def discovery_pending(self):
> +        return not bool(self.service)
> +
> +    def interfaces_added_handler(self, path, iprops, **kw):
> +        name = self.bus.get_owned_name(self.bus_match, kw['sender'])
> +        if self.discovery_pending() or \
> +                not self.bus_match(name):
> +            return
> +
> +        matches = [x for x in iprops.iterkeys() if self.intf_match(x)]
> +        self.add_interfaces(path, kw['sender'], matches)
> +
> +    def interfaces_removed_handler(self, path, interfaces, **kw):
> +        name = self.bus.get_owned_name(self.bus_match, kw['sender'])
> +        if self.discovery_pending() or \
> +                not self.bus_match(name):
> +            return
> +        item = self.cache[path]
> +        sender = kw['sender']
> +        for x in interfaces:
> +            if self.intf_match(x):
> +                try:
> +                    item[sender].remove(x)
> +                except ValueError:
> +                    pass
> +
> +        # remove the owner if there aren't any interfaces left
> +        if not item[sender]:
> +            del item[sender]
> +
> +        # update if interfaces remain
> +        if item:
> +            self.cache[path] = item
> +        # mark for removal if no interfaces remain
> +        elif self.cache.get_children(path):
> +            self.cache.demote(path)
> +        # delete the entire path if everything is gone
> +        else:
> +            del self.cache[path]
> +
> +    def process_new_owner(self, name):
> +        # unique name
> +        return self.discover([IntrospectionParser(name,
> +                             self.bus.dbus,
> +                             self.tag_match,
> +                             self.intf_match)])
> +
> +    def process_old_owner(self, name):
> +        for x, y in self.cache.dataitems():
> +            if name not in y:
> +                continue
> +            del y[name]
> +            if y:
> +                self.cache[x] = y
> +            elif self.cache.get_children(x):
> +                self.cache.demote(x)
> +            else:
> +                del self.cache[x]
> +
> +    def bus_handler(self, service, old, new):
> +        if self.discovery_pending() or \
> +                not self.bus_match(service):
> +            return
> +
> +        if new:
> +            self.process_new_owner(new)
> +        if old:
> +            self.process_old_owner(old)
> +
> +    def add_interfaces(self, path, owner, interfaces):
> +        d = self.cache.setdefault(path, {})
> +        d = d.setdefault(owner, [])
> +        self.cache[path][owner] = list(set(d + interfaces))
> +
> +    def add_items(self, owner, bus_items):
> +        for x, y in bus_items.iteritems():
> +            self.add_interfaces(x, owner, y['interfaces'])
> +
> +    def discover(self, owners=None):
> +        if not owners:
> +            owners = [IntrospectionParser(x, self.bus.dbus,
> +                                          self.tag_match,
> +                                          self.intf_match)
> +                      for x in self.bus.get_owner_names(self.bus_match)]
> +        for o in owners:
> +            self.add_items(o.name, o.introspect())
> +
> +        if self.discovery_pending():
> +            print "ObjectMapper discovery complete..."
> +            self.service = dbus.service.BusName(
> +                OpenBMCMapper.MAPPER_NAME, self.bus.dbus)
> +
> +    @dbus.service.method(OpenBMCMapper.MAPPER_IFACE, 's', 'a{sas}')
> +    def GetObject(self, path):
> +        o = self.cache.get(path)
> +        if not o:
> +            raise MapperNotFoundException(path)
> +        return o
> +
> +    @dbus.service.method(OpenBMCMapper.MAPPER_IFACE, 'si', 'as')
> +    def GetSubTreePaths(self, path, depth):
> +        try:
> +            return self.cache.iterkeys(path, depth)
> +        except KeyError:
> +            raise MapperNotFoundException(path)
> +
> +    @dbus.service.method(OpenBMCMapper.MAPPER_IFACE, 'si', 'a{sa{sas}}')
> +    def GetSubTree(self, path, depth):
> +        try:
> +            return {x: y for x, y in self.cache.dataitems(path, depth)}
> +        except KeyError:
> +            raise MapperNotFoundException(path)
> +
>  
>  class BusWrapper:
> -	def __init__(self, bus):
> -		self.dbus = bus
> +    def __init__(self, bus):
> +        self.dbus = bus
>  
> -	def get_owned_name(self, match, bus):
> -		for x in self.get_service_names(match):
> -			if self.dbus.get_name_owner(x) == bus:
> -				return x
> +    def get_owned_name(self, match, bus):
> +        for x in self.get_service_names(match):
> +            if self.dbus.get_name_owner(x) == bus:
> +                return x
>  
> -	def get_service_names(self, match):
> -		# these are well known names
> -		return [ x for x in self.dbus.list_names() \
> -				if match(x) ]
> +    def get_service_names(self, match):
> +        # these are well known names
> +        return [x for x in self.dbus.list_names()
> +                if match(x)]
>  
> -	def get_owner_names(self, match):
> -		# these are unique connection names
> -		return list( set( [ self.dbus.get_name_owner(x) \
> -				for x in self.get_service_names(match) ] ) )
> +    def get_owner_names(self, match):
> +        # these are unique connection names
> +        return list(set(
> +            [self.dbus.get_name_owner(x)
> +                for x in self.get_service_names(match)]))
>  
>  if __name__ == '__main__':
> -	dbus.mainloop.glib.DBusGMainLoop(set_as_default=True)
> -	bus = dbus.SystemBus()
> -	o = ObjectMapper(BusWrapper(bus), OpenBMCMapper.MAPPER_PATH)
> -	loop = gobject.MainLoop()
> +    dbus.mainloop.glib.DBusGMainLoop(set_as_default=True)
> +    bus = dbus.SystemBus()
> +    o = ObjectMapper(BusWrapper(bus), OpenBMCMapper.MAPPER_PATH)
> +    loop = gobject.MainLoop()
>  
> -	loop.run()
> +    loop.run()
> diff --git a/setup.cfg b/setup.cfg
> index ed3bf6e..483ca76 100644
> --- a/setup.cfg
> +++ b/setup.cfg
> @@ -1,2 +1,2 @@
>  [install]
> -install_scripts=/usr/sbin
> +install_scripts = /usr/sbin
> -- 
> 2.6.4
>
>
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
