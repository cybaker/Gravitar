'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "flutter.js": "1cfe996e845b3a8a33f57607e8b09ee4",
"index.html": "7fa8504865b1445e8bad81f35a2d151f",
"/": "7fa8504865b1445e8bad81f35a2d151f",
"main.dart.js": "cea288710b905cb4be3afc16d4716532",
"manifest.json": "530b936ef894e627e4489a4a5b5dac0c",
"favicon.png": "c113cbd9ff7f512a36079b9ab4487569",
"icons/Icon-512.png": "778b7c6f1cef4f5a077f09ab01bccce8",
"icons/Icon-maskable-512.png": "778b7c6f1cef4f5a077f09ab01bccce8",
"icons/favicon.png": "fa7fde306a35e196516bf8b1d6100f14",
"icons/Icon-maskable-192.png": "e178f53367e1179d3005e51c5675134d",
"icons/Icon-192.png": "e178f53367e1179d3005e51c5675134d",
"assets/FontManifest.json": "1fa8cf02fdf641ef4fe43dca705c2fee",
"assets/NOTICES": "9727259ad161f06bb485c3d8a9754c20",
"assets/fonts/MaterialIcons-Regular.otf": "e7069dfd19b331be16bed984668fe080",
"assets/assets/images/mercury1.jpeg": "3e3dbe58a03d3cc0fbc90c540f990521",
"assets/assets/images/planet1.png": "97b867435795719f6a5e456ea8c60389",
"assets/assets/images/neptune1.jpeg": "8edaccc7eb6b7f4e0fa115d2d37548f1",
"assets/assets/images/saturn1.jpeg": "6e0c61118cd9522484518736f21a8243",
"assets/assets/images/star_image.jpg": "33a626d21d59d4de2eeeee48c4b9e4ed",
"assets/assets/images/star_image.jpeg": "33a626d21d59d4de2eeeee48c4b9e4ed",
"assets/assets/images/jupiter3.jpeg": "11fe7240681ea2779ee9681083a4e0e8",
"assets/assets/images/planet5.jpeg": "6976c3f3e23a097ee39956eb554e8570",
"assets/assets/images/jupiter4.jpeg": "b530b0e57e1b93931347f0d0f5f58107",
"assets/assets/images/planet4.jpeg": "af89cc8be0f7563a4292b8cc0d46b920",
"assets/assets/images/planet2.png": "8dc1d72558e716824456fd54c0ec4430",
"assets/assets/images/planet3.png": "16df251d588d66e1ab6202ac39c8f944",
"assets/assets/images/io1.jpeg": "dcc54494b326168dda2b74b35e3fcac5",
"assets/assets/images/mimas1.jpeg": "7fa989e9f9afeee0df4a2c5b472ccd5b",
"assets/assets/images/README.md": "562f082fb824afec8dc34a9fa3ddd08d",
"assets/assets/images/jupiter1.jpeg": "42df338b558030508933c926c9460ba0",
"assets/assets/images/multi_fire.png": "252ed5eb339c68c5fd6079c94622b743",
"assets/assets/sfx/gravitar_enemy_shot.wav": "c77d55847faaf671577fa53d1408c638",
"assets/assets/sfx/gravitar_thrust.wav": "f9ab26c6b0444e8e1c2bd07b89abfbc7",
"assets/assets/sfx/gravitar_fuel_pickup.wav": "22eb0c9fddcef24e8de154b892be1664",
"assets/assets/sfx/gravitar_shot.wav": "fc51e4fffc3fa59766c5f39cf3de7a4a",
"assets/assets/sfx/gravitar_shield.wav": "86154ffd2008a4b84259e4bf75e875dd",
"assets/assets/sfx/gravitar_explosion.wav": "a352ee3a9afad7041fc1023c7974611a",
"assets/assets/sfx/extraShip.wav": "5eb474ea2cc6224a57fb5da1f133b1ff",
"assets/assets/AstroSpace/AstroSpace-eZ2Bg.ttf": "5892adccd6c4b8c9e80f005e7eef06f2",
"assets/assets/music/README.md": "c8f12955cd053c304b6ad0cf1b3a3056",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"assets/AssetManifest.json": "69549dd300976aa6aa36644bc158d36a",
"canvaskit/canvaskit.wasm": "3de12d898ec208a5f31362cc00f09b9e",
"canvaskit/canvaskit.js": "97937cb4c2c2073c968525a3e08c86a3",
"canvaskit/profiling/canvaskit.wasm": "371bc4e204443b0d5e774d64a046eb99",
"canvaskit/profiling/canvaskit.js": "c21852696bc1cc82e8894d851c01921a",
"version.json": "1f400a91fbcb9f05a8c0641a1b758b17"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "main.dart.js",
"index.html",
"assets/AssetManifest.json",
"assets/FontManifest.json"];
// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});

// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});

// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});

self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});

// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}

// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
