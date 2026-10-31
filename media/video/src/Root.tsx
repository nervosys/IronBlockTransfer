import { Composition } from "remotion";
import { IbtVideo } from "./IbtVideo";

export const RemotionRoot: React.FC = () => {
  return (
    <>
      <Composition
        id="IbtVideo"
        component={IbtVideo}
        durationInFrames={900}
        fps={30}
        width={1920}
        height={1080}
      />
    </>
  );
};
